import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:inteligenciaindustrialapp/src/app/models/entities/post/post_entity.dart';
import 'package:inteligenciaindustrialapp/src/app/models/entities/symbol/category/symbol_category_entity.dart';
import 'package:inteligenciaindustrialapp/src/app/models/entities/symbol/subcategory/symbol_subcategory_entity.dart';
import 'package:inteligenciaindustrialapp/src/app/models/entities/symbol/symbol_entity.dart';
import 'package:inteligenciaindustrialapp/src/app/models/entities/user/user_entity.dart';
import 'package:inteligenciaindustrialapp/src/app/models/entities/video/category/video_category_entity.dart';
import 'package:inteligenciaindustrialapp/src/app/models/entities/video/subcategory/video_subcategory_entity.dart';
import 'package:inteligenciaindustrialapp/src/app/models/entities/video/video_entity.dart';
import 'package:inteligenciaindustrialapp/src/app/screens/auth/login_controller.dart';
import 'package:inteligenciaindustrialapp/src/app/screens/auth/register_controller.dart';
import 'package:inteligenciaindustrialapp/src/app/screens/forum/forum_controller.dart';
import 'package:inteligenciaindustrialapp/src/app/screens/home/home_controller.dart';
import 'package:inteligenciaindustrialapp/src/app/screens/home/home_screen.dart';
import 'package:inteligenciaindustrialapp/src/app/screens/symbol/symbol_controller.dart';
import 'package:inteligenciaindustrialapp/src/app/screens/video/video_controller.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/extensions/user_extension.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/library/helpers/global.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/network/connection_controller.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/network/network_service.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/translate/global_translations.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/translate/preferences.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/translate/translations_controller.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wakelock/wakelock.dart';

import 'src/app/shared/alert-dialog/alert_controller.dart';
import 'src/app/shared/alert-dialog/loading_hud.dart';
import 'src/app/shared/auth/authenticated_controller.dart';
import 'src/app/shared/loading-screen/loading_controller.dart';
import 'src/app/shared/navigator/navigator_controller.dart';
import 'src/app/utils/styles/colors_style.dart';

bool intro;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _configDatabase();

  _registerStores();
  await frwkLanguage.init();

  Wakelock.enable();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

  intro = await preferences.getViewedIntro();

  UserEntity userEntity = userController.userProvider.loggedUser;
  if (userEntity != null) {
    userController.user.setDone(userEntity.toDTO());
  }

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

  getIt.registerSingleton(HomeController());
  getIt.registerSingleton(SymbolController());
  getIt.registerSingleton(VideoController());
  getIt.registerSingleton(ForumController());
  getIt.registerSingleton(RegisterController());
  getIt.registerSingleton(LoginController());
  getIt.registerSingleton(ConnectionController());
}

_configDatabase() async {
  final dir = await getApplicationDocumentsDirectory();
  Hive
    ..init(dir.path)
    ..registerAdapter(PostEntityAdapter()) //0
    ..registerAdapter(SymbolEntityAdapter()) //1
    ..registerAdapter(SymbolCategoryEntityAdapter()) //2
    ..registerAdapter(SymbolSubcategoryEntityAdapter()) //3
    ..registerAdapter(VideoEntityAdapter()) //4
    ..registerAdapter(VideoCategoryEntityAdapter()) //5
    ..registerAdapter(VideoSubcategoryEntityAdapter()) //6
    ..registerAdapter(UserEntityAdapter()); //7

  await Hive.openBox<PostEntity>('posts');
  await Hive.openBox<SymbolEntity>('symbols');
  await Hive.openBox<SymbolCategoryEntity>('symbols_categories');
  await Hive.openBox<SymbolSubcategoryEntity>('symbols_subcategories');
  await Hive.openBox<UserEntity>('users');

  /*await Hive.openBox<EmployerEntity>('employers');
  await Hive.openBox<EmployeeEntity>('employees');
  await Hive.openBox<PunchEntity>('punches');
  await Hive.openBox<QuizEntity>('quizzes');
  await Hive.openBox<QuizAnswerEntity>('answers');
  await Hive.openBox<LastPunchEntity>('last_punch');
  await Hive.openBox<ActivityEntity>('activities');
  await Hive.openBox<SendActivityEntity>('send_activities');
  await Hive.openBox<InItinereEntity>('in_itinere');
  await Hive.openBox<FileSliceEntity>('file_slices');
  await Hive.openBox<ConfigEmployeeAppEntity>('config_employee_app');
  await Hive.openBox<ConfigAppEntity>('config_app');*/
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
