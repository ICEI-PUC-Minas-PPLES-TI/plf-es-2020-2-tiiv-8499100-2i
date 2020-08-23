import 'package:flutter/material.dart';
import 'package:inteligenciaindustrialapp/src/app/components/custom_button_widget.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/library/helpers/global.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/styles/colors_style.dart';

class ReceiptScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsStyle.green,
      appBar: null,
      body: this._buildBody(),
      extendBody: true,
      bottomNavigationBar: this._buildCloseButton(),
    );
  }

  _buildBody() {
    return Container();
  }

  _buildCloseButton() {
    return CustomButtonWidget(
      onPressed: () {
        frwkNavigator.popNavigate();
      },
      title: Text(
        'Sair',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      ),
      height: 48,
      backgroundColor: ColorsStyle.orange,
      margin: EdgeInsets.only(left: 24, right: 24, bottom: 32),
    );
  }
}
