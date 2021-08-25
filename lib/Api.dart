import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:youtube_clone_bt/model/Video.dart';

const KEY_YOUTUBE_API = "AIzaSyALbRXQpcjf-S6mdvRH7O0Wsk3JI1_4tYE";
const ID_CHANNEL = "UCB_qr75-ydFVKSF9Dmo6izg";
const URL_BASE = ("https://www.googleapis.com/youtube/v3/");


class Api {
  Future<List<Video>> searchs(String search) async {
    http.Response response = await http.get(
        Uri.parse(
            URL_BASE + "search"
                "?part=snippet"
                "&type=video"
                "&maxResults=20"
                "&order=date"
                "&key=$KEY_YOUTUBE_API"
                "&channelId=$ID_CHANNEL"
                "&q=$search"
        )
    );

      Map<String, dynamic> dataJson = json.decode(response.body);
      List<Video> videos = dataJson["items"].map<Video>(
              (map) {
                return Video.fromJson(map);
            }
      ).toList();

      return videos;
  }
}