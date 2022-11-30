import 'package:flutter/material.dart';
import 'package:rounded/model/param.dart';

class ApiService{


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