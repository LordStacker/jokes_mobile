import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jokes/joke_dto.dart';
import 'joke_dto.dart';
class DataSource {
  Future<JokeDto> getJoke() async {
    const url = "https://v2.jokeapi.dev/joke/Programming,Miscellaneous,Spooky?blacklistFlags=nsfw,religious,racist,sexist,explicit";
    final response = await http.get(Uri.parse(url));
    final map = json.decode(response.body);
    return JokeDto.fromJson(map);
  }
}