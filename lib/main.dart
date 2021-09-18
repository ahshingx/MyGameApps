import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_game_apps/Layout/splash_screen.dart';
import 'package:my_game_apps/Localization/AppLanguage.dart';
import 'package:my_game_apps/Localization/AppLocalizations.dart';
import 'package:my_game_apps/Tools/Constant.dart';
import 'package:provider/provider.dart';

void main() async {
  AppLanguage appLanguageObj = AppLanguage();
  await appLanguageObj.fetchLocale();

  runApp(MyApp(appLanguage: appLanguageObj));
}

class MyApp extends StatelessWidget {

  final AppLanguage appLanguage;
  MyApp({this.appLanguage});

  @override
  Widget build(BuildContext context) {

    //Change app to portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ChangeNotifierProvider<AppLanguage>(
      create: (_) => appLanguage,
      child: Consumer<AppLanguage>(builder: (context, model, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Constant.TITLE,

          supportedLocales: const [
            Locale('en', ''),
          ],

          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],

          theme: ThemeData(primaryColor: Constant.PrimaryColor,),

          home: SplashScreen(),
        );
      }),
    );
  }
}