import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:my_game_apps/Models/Game.dart';
import 'package:http/http.dart' as http;

class GameModel{

  String apiKey = '6eaf82e6cd264cbd9ea5950dd863e5dc';
  String rootApi = 'api.rawg.io';
  String games = '/games';
  http.Client client;

  //Get All Games
  void getGames({String page, String pageSize, String platforms, Map<String, String> moreParams, @required Function(String error, String nextUrl, List<Game> games) completion,}) {
    var params = <String, String>{};
    params['page'] = page;
    params['page_size'] = pageSize;
    params['platforms'] = platforms;
    if (moreParams != null) {
      for (var key in moreParams.keys) {
        params[key] = moreParams[key];
      }
    }
    params['key'] = apiKey;

    var uri = Uri.https(rootApi, '/api$games', params);
    print(uri.toString());
    client.get(uri).then((response) {
      var responseString = utf8.decode(response.bodyBytes);
      if (response.statusCode == 200) {
        try {
          var jsonObject = json.decode(responseString) as Map<String, dynamic>;
          var gamesList = (jsonObject['results'] as List)
              .map((dynamic game) => Game.fromJson(game as Map<String, dynamic>))
              .toList();
          completion(null, (jsonObject['next'] as String), gamesList);
        } catch (e) {
          completion(e.toString(), null, null);
        }
      } else {
        completion(response.body, null, null);
      }
    });
  }

  //Get Game Detail
  void getGameDetails(String gameID, Function(String error, Game gameDetails) completion) {
    var params = <String, String>{};
    params['key'] = apiKey;

    var uri = Uri.https(rootApi, '/api$games/$gameID', params);
    print(uri.toString());
    client.get(uri).then((response) {
      var responseString = utf8.decode(response.bodyBytes);
      if (response.statusCode == 200) {
        try {
          var jsonObject = json.decode(responseString) as Map<String, dynamic>;
          var game = Game.fromJson(jsonObject);
          completion(null, game);
        } catch (e) {
          completion(e.toString(), null);
        }
      } else {
        completion(response.body, null);
      }
    });
  }
}