import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:inteligenciaindustrialapp/src/app/components/custom_button_widget.dart';
import 'package:inteligenciaindustrialapp/src/app/components/custom_container.dart';
import 'package:inteligenciaindustrialapp/src/app/screens/home2/home_controller.dart';
import 'package:inteligenciaindustrialapp/src/app/screens/menu/menu_screen.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/styles/colors_style.dart';

import '../../utils/library/helpers/global.dart';

class HomeScreen2 extends StatelessWidget {
  final _homeController = HomeController2();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsStyle.background,
      appBar: this._buildAppBar(context),
      body: this._buildBody(context),
      bottomNavigationBar: this._buildRegisterPunchButton(context),
      extendBody: true,
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsStyle.orange,
      elevation: 0,
      centerTitle: false,
      automaticallyImplyLeading: false,
      title: Row(
        children: <Widget>[
          Image.asset(
            'assets/images/ic_tanger_resumido.png',
            height: 16,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            '${frwkLanguage.text('home_screen.hello')}, ${frwkPin.employee?.getData?.name ?? ''}',
            style: TextStyle(color: Colors.white, fontSize: 20),
          )
        ],
      ),
      actions: <Widget>[
        InkWell(
          onTap: () {
            frwkNavigator.navigate(MenuScreen(), modal: true);
          },
          child: Padding(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                Text(
                  'menu',
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
                SizedBox(
                  width: 4,
                ),
                Icon(Icons.account_circle)
              ],
            ),
          ),
        )
      ],
    );
  }

  _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        this._buildHeader(),
        this._buildConnection(),
        this._buildContent(),
      ],
    );
  }

  _buildHeader() {
    return Container(
      padding: EdgeInsets.only(left: 16, bottom: 24, top: 8),
      color: ColorsStyle.orange,
      // height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              frwkLanguage.text('home_screen.location'),
              style:
                  TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 13),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.place,
                size: 16,
                color: Colors.white,
              ),
              SizedBox(
                width: 8,
              ),
              Flexible(
                child: Text(
                  'Rua Santa Rita Durão, entre o número 20 a 50',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _buildConnection() {
    return Observer(builder: (_) {
      if (this._homeController.isConnected)
        return SizedBox.shrink();
      else
        return Container(
          padding: EdgeInsets.only(left: 16, bottom: 24, top: 8),
          color: ColorsStyle.purpleLight,
          height: 110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[],
          ),
        );
    });
  }

  _buildContent() {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.all(24),
          children: <Widget>[this._buildRegistrosHoje()],
        ),
      ),
    );
  }

  _buildRegistrosHoje() {
    return CustomContainer(
      useSkeleton: true,
      radius: 4,
      color: ColorsStyle.green,
      height: 110,
    );
  }

  _buildRegisterPunchButton(BuildContext context) {
    return CustomButtonWidget(
      onPressed: () async {
        //frwkNavigator.navigate(TakePictureScreen(), modal: true);
        frwkPunch.registerPunch().then((success) {
          showPunchConfirmation(context, true);
        });
      },
      title: Text(
        frwkLanguage.text('punch.register_punch'),
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      ),
      height: 56,
      backgroundColor: ColorsStyle.orange,
      margin: EdgeInsets.only(left: 24, right: 24, bottom: 32),
    );
  }

  showPunchConfirmation(BuildContext context, bool online) {
    showFlash(
      context: context,
      duration: const Duration(seconds: 2),
      persistent: true,
      builder: (_, controller) {
        return Flash(
          controller: controller,
          backgroundColor: online ? ColorsStyle.green : ColorsStyle.purple,
          barrierColor: Colors.black38,
          barrierDismissible: true,
          style: FlashStyle.floating,
          position: FlashPosition.top,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
          child: FlashBar(
            message: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      online ? Icons.check_circle : Icons.signal_wifi_off,
                      color: online
                          ? ColorsStyle.greenLight3
                          : ColorsStyle.purpleLight,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      child: Text(
                        online
                            ? frwkLanguage.text('punch.success')
                            : frwkLanguage.text('punch.offline'),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        frwkLanguage.text('punch.view_receipt'),
                        style: TextStyle(
                            color: online
                                ? ColorsStyle.greenLight3
                                : ColorsStyle.purpleLight,
                            fontSize: 12),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: ColorsStyle.greenLight3,
                        size: 12,
                      )
                    ],
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            showProgressIndicator: true,
          ),
        );
      },
    );
  }
}
