import 'package:http/http.dart' as http;
import 'dart:convert';

const KEY_YOUTUBE_API = "";
const ID_CHANNEL = "UCB_qr75-ydFVKSF9Dmo6izg";
const URL_BASE = ("https://www.googleapis.com/youtube/v3/");


class Api {
  searchs(String search) async {
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
  }
}