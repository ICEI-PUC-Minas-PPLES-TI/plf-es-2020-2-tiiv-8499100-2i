import 'package:flutter/material.dart';
import 'package:inteligenciaindustrialapp/src/app/screens/employer_code/start_employer_code_screen.dart';
import 'package:inteligenciaindustrialapp/src/app/screens/register_company/start_company_screen.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/library/helpers/global.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/styles/colors_style.dart';

class OpeningScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsStyle.background,
      extendBodyBehindAppBar: true,
      appBar: this._buildAppBar(context),
      body: this._buildBody(context),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      title: Image.asset(
        'assets/images/logo-tangerino.png',
        height: 44,
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            frwkTranslation.setNewLanguage(
                frwkTranslation.currentLanguage == 'pt' ? 'en' : 'pt');
          },
          icon: Icon(
            Icons.language,
            color: ColorsStyle.orange,
          ),
        )
      ],
    );
  }

  _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Image.asset(
            'assets/images/background_abertura.png',
            fit: BoxFit.cover,
          ),
        ),
        this._buildBtnFuncionario(),
        this._buildBtnEmpregador()
      ],
    );
  }

  _buildBtnFuncionario() {
    return InkWell(
      onTap: () {
        print('actionFuncionario');
        frwkNavigator.navigate(StartEmployerCodeScreen());
      },
      child: Container(
        padding: EdgeInsets.only(left: 24, right: 16),
        height: 90,
        color: ColorsStyle.orange,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Text(
                frwkLanguage.text('opening_screen.btn_employee').toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 26,
            )
          ],
        ),
      ),
    );
  }

  _buildBtnEmpregador() {
    return InkWell(
      onTap: () {
        print('actionEmpregador');
        frwkNavigator.navigate(StartCompanyScreen());
      },
      child: Container(
        padding: EdgeInsets.only(left: 24, right: 16),
        height: 90,
        color: ColorsStyle.purple,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  frwkLanguage.text('opening_screen.btn_company').toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  frwkLanguage.text('opening_screen.btn_company_sub'),
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.3),
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 26,
            )
          ],
        ),
      ),
    );
  }
}
