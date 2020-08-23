import 'package:flutter/material.dart';
import 'package:inteligenciaindustrialapp/src/app/components/custom_container.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/library/helpers/global.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/styles/colors_style.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsStyle.background,
      appBar: this._buildAppBar(context),
      body: this._buildBody(context),
      extendBody: true,
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsStyle.orange,
      elevation: 0,
      centerTitle: false,
      automaticallyImplyLeading: false,
      titleSpacing: 24,
      title: Image.asset(
        'assets/images/ic_tanger_resumido_g.png',
        height: 44,
      ),
      actions: <Widget>[
        IconButton(
          alignment: Alignment.centerRight,
          onPressed: () {
            frwkNavigator.popNavigate();
          },
          icon: Icon(
            Icons.close,
            color: Colors.white,
            size: 24,
          ),
        )
      ],
    );
  }

  _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[this._buildHeader(), this._buildContent()],
    );
  }

  _buildHeader() {
    return Container(
      padding: EdgeInsets.only(left: 24, bottom: 24, top: 8),
      color: ColorsStyle.orange,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Gabriel Braga',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'PIN 3317',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }

  _buildContent() {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 8),
          children: <Widget>[
            this._buildRowMenu(
              Icon(
                Icons.notifications,
                color: ColorsStyle.orange,
                size: 24,
              ),
              frwkLanguage.text('menu.notifications'),
            ),
            this._buildRowMenu(
              Icon(
                Icons.album,
                color: ColorsStyle.orange,
                size: 24,
              ),
              frwkLanguage.text('menu.registered_punches'),
            ),
            this._buildRowMenu(
              Icon(
                Icons.edit,
                color: ColorsStyle.orange,
                size: 24,
              ),
              frwkLanguage.text('menu.adjustment_requests'),
            ),
            this._buildRowMenu(
              Icon(
                Icons.message,
                color: ColorsStyle.orange,
                size: 24,
              ),
              frwkLanguage.text('menu.messages'),
            ),
            this._buildRowMenu(
              Icon(
                Icons.flag,
                color: ColorsStyle.orange,
                size: 24,
              ),
              frwkLanguage.text('menu.activities'),
            ),
            SizedBox(
              height: 8,
            ),
            Divider(
              color: ColorsStyle.orangeLight,
            ),
            SizedBox(
              height: 8,
            ),
            this._buildRowMenu(
              Icon(
                Icons.help,
                color: ColorsStyle.orange,
                size: 24,
              ),
              frwkLanguage.text('menu.faq'),
            ),
            this._buildRowMenu(
              Icon(
                Icons.settings,
                color: ColorsStyle.orange,
                size: 24,
              ),
              frwkLanguage.text('menu.settings'),
            ),
            this._buildRowMenu(
              Icon(
                Icons.arrow_back,
                color: ColorsStyle.orange,
                size: 24,
              ),
              frwkLanguage.text('menu.log_out'),
            ),
          ],
        ),
      ),
    );
  }

  _buildRowMenu(Icon icon, String title) {
    return CustomContainer(
      onTap: () {
        print('tap');
      },
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 48,
      child: Row(
        children: <Widget>[
          icon,
          SizedBox(
            width: 16,
          ),
          Text(
            title,
            style: TextStyle(
                color: ColorsStyle.gray,
                fontSize: 16,
                fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }
}
