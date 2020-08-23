import 'package:flutter/material.dart';
import 'package:inteligenciaindustrialapp/src/app/components/custom_button_widget.dart';
import 'package:inteligenciaindustrialapp/src/app/screens/employer_code/insert_employer_code_screen.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/library/helpers/global.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/styles/colors_style.dart';

class StartEmployerCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsStyle.background,
      appBar: this._buildAppBar(context),
      body: this._buildBody(context),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsStyle.orange,
      elevation: 0,
    );
  }

  _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        this._buildHeader(),
        this._buildContent(),
        this._buildContinueButton()
      ],
    );
  }

  _buildHeader() {
    return Container(
      padding: EdgeInsets.only(left: 24, bottom: 32, top: 4),
      height: 120,
      color: ColorsStyle.orange,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            frwkLanguage.text('start_employer_code_screen.code'),
            style: TextStyle(
                color: Colors.white, fontSize: 32, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  _buildContent() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 24, right: 48, top: 48, bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              frwkLanguage.text('start_employer_code_screen.question'),
              style: TextStyle(
                  color: ColorsStyle.grayDark,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              frwkLanguage.text('start_employer_code_screen.info'),
              style: TextStyle(
                  color: ColorsStyle.gray,
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              frwkLanguage.text('start_employer_code_screen.no_code'),
              style: TextStyle(
                  color: ColorsStyle.orange,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  _buildContinueButton() {
    return CustomButtonWidget(
      onPressed: () {
        frwkNavigator.navigate(InsertEmployerCodeScreen());
      },
      title: Text(
        frwkLanguage.text('start_employer_code_screen.button'),
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      ),
      height: 56,
      backgroundColor: ColorsStyle.orange,
      margin: EdgeInsets.only(left: 24, right: 24, bottom: 32),
    );
  }
}
