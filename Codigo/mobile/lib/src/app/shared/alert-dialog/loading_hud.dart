import 'package:flutter/material.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/library/helpers/global.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/styles/colors_style.dart';

class LoadingHUD {
  void showLoading() {
    try {
      FocusScope.of(frwkNavigator.currentContext).unfocus();
      showDialog(
        context: frwkNavigator.currentContext,
        builder: (x) => LoadingWidget(),
        barrierDismissible: true,
      );
    } catch (e) {
      print('showLoading => invalid context');
    }
  }
}

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0.0,
      backgroundColor: Colors.white,
      child: _dialogContent(context),
    );
  }

  _dialogContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                  ColorsStyle.orange,
                ),
                backgroundColor: ColorsStyle.orangeLight,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Carregando',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ColorsStyle.gray,
                fontSize: 17,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
