import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:inteligenciaindustrialapp/src/app/components/custom_button_widget.dart';
import 'package:inteligenciaindustrialapp/src/app/components/text_field_widget.dart';
import 'package:inteligenciaindustrialapp/src/app/shared/loading-screen/loading_screen.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/library/helpers/global.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/styles/colors_style.dart';

class InsertEmployerCodeScreen extends StatelessWidget {
  final txtCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LoadingScreen(body: this._buildScaffold(context));
  }

  _buildScaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsStyle.background,
      appBar: this._buildAppBar(context),
      body: this._buildBody(context),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          frwkNavigator.popNavigate();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: ColorsStyle.orange,
        ),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        this._buildContent(context),
        this._buildFooterButton(context)
      ],
    );
  }

  _buildContent(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RichText(
              maxLines: 1,
              text: TextSpan(
                text: frwkLanguage.text('insert_employer_code_screen.what'),
                style: TextStyle(
                  color: ColorsStyle.gray,
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: frwkLanguage.text('insert_employer_code_screen.code'),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: ColorsStyle.orange),
                  ),
                  TextSpan(
                    text: '?',
                  )
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Observer(
              builder: (_) {
                return Column(
                  children: <Widget>[
                    TextFieldWidget(
                      textColor: frwkEmployer.employer.isError
                          ? ColorsStyle.red
                          : ColorsStyle.gray,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      textCapitalization: TextCapitalization.characters,
                      autofocus: true,
                      cursorColor: ColorsStyle.orange,
                      controller: this.txtCode,
                      onChanged: (str) {
                        frwkEmployer.employer.setPending();
                        if (str.length == 5) {
                          frwkEmployer.getEmployer(txtCode.text);
                          FocusScope.of(context).requestFocus(FocusNode());
                        }
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    frwkEmployer.employer.isError
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.cancel,
                                color: ColorsStyle.red,
                                size: 12,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                frwkLanguage.text(
                                    'insert_employer_code_screen.error_message'),
                                style: TextStyle(
                                    color: ColorsStyle.red,
                                    height: 1.6,
                                    fontSize: 13),
                              ),
                            ],
                          )
                        : SizedBox.shrink()
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }

  _buildFooterButton(BuildContext context) {
    return CustomButtonWidget(
      onPressed: () async {
        frwkEmployer.getEmployer(txtCode.text);
        FocusScope.of(context).requestFocus(FocusNode());
      },
      title: Text(
        frwkLanguage.text('commons.continue').toUpperCase(),
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      ),
      height: 56,
      backgroundColor: ColorsStyle.orange,
      margin: EdgeInsets.only(left: 24, right: 24, bottom: 32),
    );
  }
}
