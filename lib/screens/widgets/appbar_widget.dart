import 'package:flutter/material.dart';

AppBar MainOfAppBar(String title){
  return AppBar(
    shadowColor: Colors.transparent,
    backgroundColor: Colors.white,
    title: Text(
      title,
      style: const TextStyle(
          color: Colors.black
      ),
    ),
  );
}