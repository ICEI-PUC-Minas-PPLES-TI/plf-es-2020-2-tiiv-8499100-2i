import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:inteligenciaindustrialapp/src/app/screens/employer_code/insert_employer_code_controller.dart';
import 'package:inteligenciaindustrialapp/src/app/screens/home/home_screen.dart';
import 'package:inteligenciaindustrialapp/src/app/screens/pin/pin_controller.dart';
import 'package:inteligenciaindustrialapp/src/app/screens/punch/punch_controller.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/library/helpers/global.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/network/network_service.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/translate/global_translations.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/translate/translations_controller.dart';
import 'package:intl/intl.dart';
import 'package:wakelock/wakelock.dart';

import 'src/app/shared/alert-dialog/alert_controller.dart';
import 'src/app/shared/alert-dialog/loading_hud.dart';
import 'src/app/shared/auth/authenticated_controller.dart';
import 'src/app/shared/loading-screen/loading_controller.dart';
import 'src/app/shared/navigator/navigator_controller.dart';
import 'src/app/utils/styles/colors_style.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  _registerStores();
  await frwkLanguage.init();

  Wakelock.enable();

  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //       systemNavigationBarDividerColor: Colors.red,
  //       systemNavigationBarColor: Colors.white,
  //       statusBarColor: Colors.black26,
  //       statusBarBrightness: Brightness.light,
  //       statusBarIconBrightness: Brightness.light),
  // );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

  runApp(MyApp());

  Intl.defaultLocale = 'pt';

  // initializeDateFormatting("pt_BR", null).then((_) => runApp(MyApp()));
}

_registerStores() {
  GetIt getIt = GetIt.I;

  // ** BASE **
  getIt.registerSingleton(NavigatorController());
  getIt.registerSingleton(LoadingController());
  getIt.registerSingleton(AlertController());
  getIt.registerSingleton(LoadingHUD());

  // ** LANGUAGE **

  getIt.registerSingleton(GlobalTranslations());
  getIt.registerSingleton(TranslationsController());

  // ** APPLICATION **

  getIt.registerSingleton(NetworkService());
  getIt.registerSingleton(AuthenticatedController());
  getIt.registerSingleton(InsertEmployerCodeController());
  getIt.registerSingleton(PinController());
  getIt.registerSingleton(PunchController());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    GetIt.I<NavigatorController>().setNavigatorKey(this._navigatorKey);

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Observer(
      builder: (_) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'TangerinoApp',
          navigatorKey: this._navigatorKey,
          locale: frwkTranslation.currentLocale,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: frwkLanguage.supportedLocales(),
          theme: ThemeData(
            fontFamily: 'Roboto',
            backgroundColor: ColorsStyle.background,
            canvasColor: Colors.transparent,
          ),
          // home: AberturaScreen(),
          home: HomeScreen(),
        );
      },
    );
  }
}
