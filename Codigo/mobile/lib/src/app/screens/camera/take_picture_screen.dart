import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/library/helpers/global.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/styles/colors_style.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

class TakePictureScreen extends StatefulWidget {
  TakePictureScreen();

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  CameraController _controller;
  bool cameraReady = false;

  @override
  void initState() {
    this._selectCamera();
    super.initState();
  }

  _selectCamera() async {
    var cameras = await availableCameras();

    if (cameras.length > 0) {
      var selfieCamera = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front);

      _controller = CameraController(
        selfieCamera,
        ResolutionPreset.ultraHigh,
      );

      this._controller.initialize().then(
        (_) {
          setState(
            () {
              this.cameraReady = true;
            },
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: null,
      body: this._buildBody(context),
      extendBody: false,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: Container(
      //   margin: EdgeInsets.only(bottom: 32),
      //   width: 80,
      //   height: 80,
      //   child: FloatingActionButton(
      //     child: Icon(
      //       Icons.camera_alt,
      //       size: 32,
      //     ),
      //     backgroundColor: ColorsStyle.laranja,
      //     onPressed: () async {
      //       try {
      //         // await _initializeControllerFuture;

      //         final path = join(
      //           (await getTemporaryDirectory()).path,
      //           '${DateTime.now()}.png',
      //         );

      //         await _controller.takePicture(path);

      //         _openTelaConfirmacao(File(path));
      //       } catch (e) {
      //         print(e);
      //       }
      //     },
      //   ),
      // ),
    );
  }

  _buildBody(BuildContext context) {
    if (this.cameraReady) {
      return Stack(
        children: <Widget>[
          Positioned.fill(child: CameraPreview(_controller)),
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: this._buildHeader(),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: this._buildFooter(),
          )
        ],
      );
    }
  }

  _buildHeader() {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      color: ColorsStyle.getColorByHex('#292929').withOpacity(0.5),
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          IconButton(
            alignment: Alignment.centerRight,
            onPressed: () {
              frwkNavigator.popNavigate();
            },
            icon: Icon(
              Icons.close,
              color: Colors.white,
              size: 32,
            ),
          ),
          Text(
            frwkLanguage.text('camera.user_action'),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          )
        ],
      ),
    );
  }

  _buildFooter() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      color: ColorsStyle.getColorByHex('#292929').withOpacity(0.5),
      height: 120,
      child: Center(
        child: Container(
          width: 72,
          height: 72,
          child: FloatingActionButton(
            child: Icon(
              Icons.camera_alt,
              size: 32,
            ),
            backgroundColor: ColorsStyle.orange,
            onPressed: () async {
              frwkNavigator.popNavigate();
              try {
                //await _initializeControllerFuture;

                final path = join(
                  (await getTemporaryDirectory()).path,
                  '${DateTime.now()}.png',
                );

                await _controller.takePicture(path);

                _confirmPunch(File(path));
              } catch (e) {
                print(e);
              }
            },
          ),
        ),
      ),
    );
  }

  _confirmPunch(File imgFile) {
    List<int> imageBytes = imgFile.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);
  }
}
