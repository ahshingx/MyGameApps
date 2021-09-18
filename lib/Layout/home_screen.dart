import 'package:my_game_apps/Layout/game_details_screen.dart';
import 'package:my_game_apps/Models/Game.dart';
import 'package:my_game_apps/Models/GameModel.dart';
import 'package:my_game_apps/BaseLayout/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_game_apps/Tools/Constant.dart';
import 'package:my_game_apps/Tools/Util.dart';
import 'package:my_game_apps/Widgets/GameCard.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {

  HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  DateTime currentBackPressTime;

  GameModel gameModel = GameModel();
  Game gameObj;
  List<Game> gameList = [];

  @override
  Widget build(BuildContext context) {
    List<Game> gameList = ModalRoute.of(context).settings.arguments;
    this.gameList = gameList;

    return WillPopScope(
      onWillPop: onWillPop,
      child: BaseAppBar(
        widget: ListView.builder(
          itemCount: gameList.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: () {
                  onPress(gameList[index].id);
                },
                child: GameCard(
                  id: gameList[index].id ?? 0,
                  title: gameList[index].name ?? Util.getTextFromJson(context, 'no_data'),
                  metacritic: gameList[index].metacritic ?? 0,
                  releaseDate: gameList[index].released ?? Util.getTextFromJson(context, 'no_data'),
                  backgroundImage: gameList[index].backgroundImage ?? "",
                ),
            );
          },
        ),
      ),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      return Future.value(false);
    }
    return Future.value(true);
  }

  void onPress(int id) {
    getGameDetails(id);
  }

  Future<void> getGameDetails(int id) async {
    gameModel.client = http.Client();

    if(await Util.checkInternetConnection()){
      gameModel.getGameDetails('$id', (error, gameDetails) {
        setState(() {
          gameObj = gameDetails;
          List objectList = [];

          for(Game g in gameList ){
            if(g.id == id){
              objectList = [gameObj, g.shortScreenshots];
            }
          }

          Util.pushToNextScreen(context, () => GameDetailsScreen(), Constant.GAME_DETAILS_SCREEN, objectList);
        });
      });
    } else {
      showAlertDialog(context, Util.getTextFromJson(context, 'no_internet_connection'), id);
    }
  }

  showAlertDialog(BuildContext context, String message, int id) {
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
                child: const Text("OK",style: TextStyle(color: Colors.orange)),
                onPressed: () {
                  Navigator.of(context).pop(true);
                  getGameDetails(id);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}