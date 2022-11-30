import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rounded/architecture/provider_main.dart';
import 'package:rounded/model/param.dart';
import 'package:rounded/screens/widgets/item_of_parms.dart';

Widget ListOfParams(ProviderMain providerMain,context){

  ScrollController controllerOfParams = ScrollController();

  var db = Hive.box<Params>("params");

  return ValueListenableBuilder(
    valueListenable: db.listenable(),
    builder: (context,Box<Params> value, child){
      List<int> paramsList = value.keys.cast<int>().toList();
      return GridView.builder(
        itemCount: 4,
        shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2), itemBuilder: (
          context, index) {
          int param = paramsList[index];
          Params? params = value.get(param);
        return ItemOfParams(
            providerMain, index, context, controllerOfParams,index
        );
      }
      );
  }
  );

}
