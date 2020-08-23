import 'package:flutter/material.dart';
import 'package:inteligenciaindustrialapp/src/app/components/custom_button_widget.dart';
import 'package:inteligenciaindustrialapp/src/app/components/custom_container.dart';
import 'package:inteligenciaindustrialapp/src/app/screens/register_company/confirmation_company_screen.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/library/helpers/global.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/styles/colors_style.dart';

class EmployeesCompanyScreen extends StatefulWidget {
  final dynamic body;

  EmployeesCompanyScreen(this.body);

  @override
  _EmployeesCompanyScreenState createState() => _EmployeesCompanyScreenState();
}

class _EmployeesCompanyScreenState extends State<EmployeesCompanyScreen> {
  var selected = '1 - 10';

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
              '6/6 ${frwkLanguage.text('register_company.steps')}',
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
                text:
                    '${frwkLanguage.text('register_company.employees.what')} ',
                style: TextStyle(
                  color: ColorsStyle.gray,
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text:
                        '${frwkLanguage.text('register_company.employees.name')} ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: ColorsStyle.purple),
                  ),
                  TextSpan(
                    text:
                        '${frwkLanguage.text('register_company.employees.have')}?',
                  )
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Expanded(
              child: Center(
                child: Container(
                  child: GridView.count(
                    shrinkWrap: true,
                    // physics: ScrollPhysics(),
                    primary: false,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 16,
                    crossAxisCount: 2,
                    childAspectRatio: 8 / 6,
                    children: <Widget>[
                      this._buildContainerQuantidade('1 - 10'),
                      this._buildContainerQuantidade('11 - 20'),
                      this._buildContainerQuantidade('21 - 50'),
                      this._buildContainerQuantidade('51 - 100'),
                      this._buildContainerQuantidade('51 - 500'),
                      this._buildContainerQuantidade('+500'),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildContainerQuantidade(String text) {
    return CustomContainer(
      onTap: () {
        setState(() {
          this.selected = text;
        });
      },
      radius: 4,
      borderColor:
          text == selected ? ColorsStyle.purple : ColorsStyle.grayLight,
      color: text == selected ? ColorsStyle.purpleLight : Colors.transparent,
      borderWidth: text == selected ? 2 : 1,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: ColorsStyle.purple,
              fontSize: 22,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  _buildFooterButton() {
    return CustomButtonWidget(
      onPressed: () {
        frwkNavigator.navigate(ConfirmationCompanyScreen());
      },
      title: Text(
        frwkLanguage.text('register_company.employees.confirm'),
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      ),
      height: 56,
      backgroundColor: ColorsStyle.purple,
      margin: EdgeInsets.only(left: 24, right: 24, bottom: 32),
    );
  }
}
