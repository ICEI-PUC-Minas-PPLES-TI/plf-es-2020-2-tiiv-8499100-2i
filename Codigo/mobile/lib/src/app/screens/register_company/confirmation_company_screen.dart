import 'package:flutter/material.dart';
import 'package:inteligenciaindustrialapp/src/app/components/custom_button_widget.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/library/helpers/global.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/styles/colors_style.dart';

class ConfirmationCompanyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: ColorsStyle.background,
        body: this._buildBody(context),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Image.asset(
            'assets/images/background_abertura.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            this._buildHeader(),
            this._buildContent(),
            this._buildContinueButton()
          ],
        ))
      ],
    );
  }

  _buildHeader() {
    return Container(
      padding: EdgeInsets.only(left: 24, right: 24, bottom: 16, top: 4),
      height: 180,
      color: ColorsStyle.getColorByHex('#292929').withOpacity(0.6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
            maxLines: 1,
            text: TextSpan(
              text:
                  '${frwkLanguage.text('register_company.confirmation.success_start')} ',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 22,
              ),
              children: <TextSpan>[
                TextSpan(
                  text:
                      '${frwkLanguage.text('register_company.confirmation.success_end')}!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            '${frwkLanguage.text('register_company.confirmation.information')}!',
            style: TextStyle(
                color: ColorsStyle.grayLight,
                fontSize: 13,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    frwkLanguage
                        .text('register_company.confirmation.employer_code'),
                    style: TextStyle(
                        color: ColorsStyle.grayLight,
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'OWUPE',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    frwkLanguage
                        .text('register_company.confirmation.employer_pin'),
                    style: TextStyle(
                        color: ColorsStyle.grayLight,
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    '3625',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  _buildContent() {
    return Expanded(child: Container());
  }

  _buildContinueButton() {
    return CustomButtonWidget(
      onPressed: () {
        frwkNavigator.popToRoot();
      },
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                frwkLanguage.text('commons.continue'),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                frwkLanguage.text('register_company.confirmation.action'),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
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
      height: 94,
      backgroundColor: ColorsStyle.purple,
    );
  }
}
