import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube_cover/model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyBQQgpSs7BuKcz7OnOGUBpIYMNdtQSZqRE";
const ID_CANAL = "UCf85lrh_c5hyno4fD6XFl1A";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api{

  Future<List<Video>> pesquisar(String pesquisa) async{

    http.Response response = await http.get(Uri.parse
      (URL_BASE + "search"
          "?part=snippet"
          "&type=video"
          "&maxResults=20"
          "&order=date"
          "&key=$CHAVE_YOUTUBE_API"
          //"&channelId=$ID_CANAL"
          "&q=$pesquisa")
    );
    if(response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos = dadosJson["items"].map<Video>(
              (map) {
            return Video.fromJson(map);
            //return Video.converterJson(map);
          }
      ).toList();

      return videos;

    }else{

    }

    }
  }

