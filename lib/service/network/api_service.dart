import 'dart:convert';

import 'package:rounded/model/param.dart';
import 'package:http/http.dart' as http;

class ApiService{

  String Base_URL = "https://api.unsplash.com";
  String API_Path = "/photos/random";
  String token = "mT8hj53DywChJkbscZAN5aHio9v2M9impW_i-VIc7vs";

  Future<String> getRandomImage() async{
    var uri = Uri.parse("https://api.unsplash.com/photos/random/?client_id=mT8hj53DywChJkbscZAN5aHio9v2M9impW_i-VIc7vs");
    var response = await http.get(uri);
    var data = jsonDecode(response.body);
    return data['urls']['small'];
  }

  Future<List<Params>> GET_PARMS_INFO() async{
    return [
      Params(
          name: 'Grammar',
          valuePro: 0,
          color: 'blue',
          imageUrl: 'assets/image/book.png',
        isPremium: 'notPremium',
        id: 1
      ),
      Params(
          name: 'Vocabulary',
          valuePro: 0,
          color: 'green',
          imageUrl: 'assets/image/book.png',
        isPremium: 'premium',
          id: 2
      ),
      Params(
          name: 'Speaking',
          valuePro: 0,
          color: 'purpleAccent',
          imageUrl: 'assets/image/book.png',
        isPremium: 'premium',
          id: 3
      ),
      Params(
          name: 'Listening',
          valuePro: 0,
          color: 'red',
          imageUrl: 'assets/image/book.png',
        isPremium: 'premium',
          id: 4
      ),
    ];
  }

}