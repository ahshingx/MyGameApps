import 'package:my_game_apps/Models/Game.dart';
import 'package:my_game_apps/BaseLayout/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_game_apps/Tools/Constant.dart';
import 'package:my_game_apps/Tools/Util.dart';
import 'package:my_game_apps/Widgets/GameCard.dart';

class GameDetailsScreen extends StatefulWidget {

  GameDetailsScreen();

  @override
  _GameDetailsScreenState createState() => _GameDetailsScreenState();
}

class _GameDetailsScreenState extends State<GameDetailsScreen> {

  @override
  Widget build(BuildContext context) {

    List objectList = ModalRoute.of(context).settings.arguments;
    Game gameOjb = objectList[0];
    List<ShortScreenshots> shortScreenshotsList = objectList[1];

    return BaseAppBar(
        widget: SingleChildScrollView(
          child: Column(
              children: <Widget>[
                GameCard(
                  id: gameOjb.id ?? 0,
                  title: gameOjb.name ?? Util.getTextFromJson(context, 'no_data'),
                  metacritic: gameOjb.metacritic ?? 0,
                  releaseDate: gameOjb.released ?? Util.getTextFromJson(context, 'no_data'),
                  backgroundImage: gameOjb.backgroundImage ?? "",
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Column(
                        children: <Widget>[
                          ItemField(Util.getTextFromJson(context, 'name'), gameOjb.name),
                          Row(
                            children: <Widget>[
                              ItemFieldMultipleData(Util.getTextFromJson(context, 'other_platforms'), gameOjb),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              ItemFieldMultipleData(Util.getTextFromJson(context, 'genres'), gameOjb),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              ItemFieldMultipleData(Util.getTextFromJson(context, 'developers'), gameOjb),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              ItemFieldMultipleData(Util.getTextFromJson(context, 'publishers'), gameOjb),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: TextField(Util.getTextFromJson(context, 'screenshots')),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20,0,25,0),
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  height: 150,
                  child: ListView.builder(
                    itemCount: shortScreenshotsList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {

                        },
                        child:Card(
                            clipBehavior: Clip.antiAlias,
                            child: Image.network(shortScreenshotsList[index].image),
                        ),
                      );
                    },
                  ),
                )
              ]
          ),
        ),
    );
  }
}

class TextField extends StatelessWidget {
  TextField(this.textField);

  String textField;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 10,
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Row(
        children: [
          Container(
            width: 100,
            child: Text(textField + ': ',
                textAlign: TextAlign.left,
                style:const TextStyle(fontSize:16,fontWeight: FontWeight.bold)
            ),
          ),
        ],
      ),
      alignment: Alignment.centerLeft,
    );
  }
}

class ItemField extends StatelessWidget {
  ItemField(this.textField, this.data);

  String textField;
  String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 10,
      padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
      child: Row(
        children: [
          Container(
            width: 100,
            child: Text(textField + ': ',
                textAlign: TextAlign.left,
                style:const TextStyle(fontSize:16,fontWeight: FontWeight.bold)
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 150,
            child: Text(data,
                style:const TextStyle(fontSize:16,fontWeight: FontWeight.bold)
            ),
          ),
        ],
      ),
      alignment: Alignment.centerLeft,
    );
  }
}

class ItemFieldMultipleData extends StatelessWidget {
  ItemFieldMultipleData(this.textField, this.data);

  String textField;
  Game data;

  @override
  Widget build(BuildContext context) {

    String dataText = combineWords(textField, data);

    return Container(
      width: MediaQuery.of(context).size.width - 10,
      padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
      child: Row(
        children: [
          Container(
            width: 100,
            child: Text(textField + ': ',
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 150,
            child: Text(dataText, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
            ),
          ),
        ],
      ),
      alignment: Alignment.centerLeft,
    );
  }
}

String combineWords(String textField, Game data) {
  String dataText = "";
  final list = [];

  switch (textField) {
    case Constant.OTHER_PLATFORMS:
      for (var i in data.platforms) {
        dataText += i.platform.name + ", ";
      }
      break;
    case Constant.GENRES:
      for (Genres g in data.genres) {
        list.add(g.name);
      }
      final sb = StringBuffer();
      sb.writeAll(list, ', ');
      dataText = sb.toString();
      break;
    case Constant.DEVELOPERS:
      for (Developers d in data.developers) {
        list.add(d.name);
      }
      final sb = StringBuffer();
      sb.writeAll(list, ', ');
      dataText = sb.toString();
      break;
    case Constant.PUBLISHERS:
      for (Publishers p in data.publishers) {
        list.add(p.name);
      }
      final sb = StringBuffer();
      sb.writeAll(list, ', ');
      dataText = sb.toString();
      break;
  }
  return dataText;
}