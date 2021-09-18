import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_game_apps/Models/Game.dart';
import 'package:my_game_apps/Models/GameModel.dart';
import 'package:my_game_apps/Tools/Constant.dart';
import 'package:my_game_apps/Tools/Util.dart';
import 'package:http/http.dart' as http;
import 'home_screen.dart';

// This is the Splash Screen
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{

  GameModel gameModel = GameModel();
  List<Game> gameList = [];

  Future<void> getGameList() async {
    gameModel.client = http.Client();

    if(await Util.checkInternetConnection()){
      gameModel.getGames(
          page: Constant.GAME_PAGE,
          pageSize: Constant.GAME_PAGE_SIZE,
          platforms: Constant.GAME_PLATFORM,
          moreParams: {
            Constant.REQUEST_DATES: '2020-05-18,2021-05-18',
            Constant.REQUEST_ORDERING: Constant.ORDERING_RELEASED
          },
          completion: (String error, String nextUrl, List<Game> games) {
            setState(() {
              gameList = games;
              moveToHomeScreen(gameList);
            });
          });
    } else {
      showAlertDialog(context, Util.getTextFromJson(context, 'no_internet_connection'));
    }
  }

  Future<void> moveToHomeScreen(List<Game> gameList) async {
    Timer(Duration(seconds: 2), () async {
      Util.pushReplacementNextScreen(context, () => HomeScreen(), Constant.HOME_SCREEN, gameList);
    });
  }

  @override
  void initState() {
    super.initState();

    getGameList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            "assets/splashscreen.jpg",
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context, String message) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            elevation: 5.0,
            contentPadding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 0),
            content: Text(message),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              TextButton(
                child: const Text("OK", style: TextStyle(color: Colors.orange)),
                onPressed: () {
                  Navigator.of(context).pop(true);
                  getGameList();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}