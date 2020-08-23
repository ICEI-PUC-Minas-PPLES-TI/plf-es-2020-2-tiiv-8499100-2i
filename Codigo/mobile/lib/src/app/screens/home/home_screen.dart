import 'package:flutter/material.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/styles/colors_style.dart';

class HomeScreen extends StatelessWidget {
  //final _homeController = HomeController();
  List<String> tabs = ['Início', 'Vídeos', 'Fórum', 'Calculadoras'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: ColorsStyle.background,
        appBar: this._buildAppBar(context),
        body: this._buildBody(context),
        extendBody: true,
      ),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 2,
      title: Row(
        children: <Widget>[
          Image.asset(
            'assets/images/logo2i.png',
            height: 32,
          ),
          SizedBox(
            width: 8,
          ),
          Text('inteligência industrial')
        ],
      ),
      bottom: TabBar(
        isScrollable: true,
        tabs: [
          for (final tab in tabs)
            Tab(
              child: Text(
                tab,
                style: TextStyle(fontSize: 20),
              ),
            )
        ],
      ),
    );
  }

  _buildBody(BuildContext context) {
    return TabBarView(
      children: <Widget>[
        for (final tab in tabs)
          Center(
            child: Text(tab),
          ),
      ],
    );
  }
}
