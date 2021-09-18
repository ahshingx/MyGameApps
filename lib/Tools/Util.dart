import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_game_apps/Localization/AppLocalizations.dart';

class Util {
  //Method used to load string file from JSON file
  static String getTextFromJson(BuildContext context, String key) {
    String text = '';

    try {
      text = AppLocalizations.of(context).translate(key);
    } catch (error) {
      print('Error [getTextFromJson] : $error');
    }

    return text;
  }

  //Method used to check internet connection
  static Future<bool> checkInternetConnection() async {
    bool isConnected;
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      print('connectivity result : $connectivityResult');

      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          print("1 true");
          isConnected = true;
        }
      } on SocketException catch (_) {
        print("2 false");
        isConnected = false;
      }

    } else {
      isConnected = false;
    }

    return isConnected;
  }

  static pushToNextScreen(BuildContext context, Widget Function() createScreen, String screenName, Object arguments) {
    Navigator.push(context, CupertinoPageRoute<bool>(
      builder: (context) => createScreen(),
      settings: RouteSettings(name: screenName, arguments: arguments),
    ));
  }

  static pushReplacementNextScreen(BuildContext context, Widget Function() createScreen, String screenName, Object arguments) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        settings: RouteSettings(
          name: screenName,
          arguments: arguments,
        ),
        builder: (BuildContext context) {
          return createScreen();
        }));
  }
}