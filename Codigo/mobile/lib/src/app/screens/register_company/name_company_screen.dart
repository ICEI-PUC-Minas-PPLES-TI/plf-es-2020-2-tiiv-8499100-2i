import 'package:flutter/material.dart';
import 'package:inteligenciaindustrialapp/src/app/components/custom_button_widget.dart';
import 'package:inteligenciaindustrialapp/src/app/components/text_field_widget.dart';
import 'package:inteligenciaindustrialapp/src/app/screens/register_company/employees_company_screen.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/library/helpers/global.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/styles/colors_style.dart';

class NameCompanyScreen extends StatelessWidget {
  final dynamic body;

  NameCompanyScreen(this.body);

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
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          frwkNavigator.popNavigate();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: ColorsStyle.purple,
        ),
      ),
      actions: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 16),
          child: Center(
            child: Text(
              '5/6 ${frwkLanguage.text('register_company.steps')}',
              style: TextStyle(
                  color: ColorsStyle.gray,
                  fontSize: 13,
                  fontWeight: FontWeight.normal),
            ),
          ),
        )
      ],
    );
  }

  _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[this._buildContent(), this._buildFooterButton()],
    );
  }

  _buildContent() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RichText(
              maxLines: 1,
              text: TextSpan(
                text: '${frwkLanguage.text('register_company.company.what')} ',
                style: TextStyle(
                  color: ColorsStyle.gray,
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: frwkLanguage.text('register_company.company.name'),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: ColorsStyle.purple),
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
            TextFieldWidget(
              textColor: ColorsStyle.gray,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              textCapitalization: TextCapitalization.words,
              autofocus: true,
              cursorColor: ColorsStyle.purple,
            )
          ],
        ),
      ),
    );
  }

  _buildFooterButton() {
    return CustomButtonWidget(
      onPressed: () {
        var body = {};
        frwkNavigator.navigate(EmployeesCompanyScreen(body));
      },
      title: Text(
        frwkLanguage.text('register_company.company.confirm'),
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      ),
      height: 56,
      backgroundColor: ColorsStyle.purple,
      margin: EdgeInsets.only(left: 24, right: 24, bottom: 32),
    );
  }
}
