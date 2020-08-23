import 'package:flutter/material.dart';
import 'package:inteligenciaindustrialapp/src/app/components/custom_button_widget.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/library/helpers/global.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/styles/colors_style.dart';

import 'name_employer_screen.dart';

class StartCompanyScreen extends StatelessWidget {
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
      backgroundColor: ColorsStyle.purple,
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
      height: 160,
      color: ColorsStyle.purple,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            'assets/images/logo-tangerino.png',
            height: 44,
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            frwkLanguage.text('register_company.start_screen.title'),
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
        padding: EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                frwkLanguage.text('register_company.start_screen.try'),
                style: TextStyle(
                    color: ColorsStyle.gray,
                    fontSize: 22,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                frwkLanguage.text('register_company.start_screen.days'),
                style: TextStyle(
                    color: ColorsStyle.purple,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                frwkLanguage.text('register_company.start_screen.register'),
                style: TextStyle(
                    color: ColorsStyle.gray,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 24,
              ),
              this._buildRowItem('register_company.start_screen.reduction'),
              SizedBox(
                height: 16,
              ),
              this._buildRowItem('register_company.start_screen.prevent'),
              SizedBox(
                height: 16,
              ),
              this._buildRowItem('register_company.start_screen.security'),
            ],
          ),
        ),
      ),
    );
  }

  _buildRowItem(String keyText) {
    return Row(
      children: <Widget>[
        Text(
          '•',
          style: TextStyle(
              color: ColorsStyle.purple,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 16,
        ),
        Text(
          frwkLanguage.text(keyText),
          style: TextStyle(
              color: ColorsStyle.gray,
              fontSize: 16,
              fontWeight: FontWeight.normal),
        ),
      ],
    );
  }

  _buildContinueButton() {
    return CustomButtonWidget(
      onPressed: () {
        frwkNavigator.navigate(NameEmployerScreen());
      },
      title: Text(
        frwkLanguage.text('commons.continue').toUpperCase(),
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      ),
      height: 56,
      backgroundColor: ColorsStyle.purple,
      margin: EdgeInsets.only(left: 24, right: 24, bottom: 32),
    );
  }
}
