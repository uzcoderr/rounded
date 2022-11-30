import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:rounded/architecture/provider_main.dart';
import 'package:rounded/model/param.dart';

Widget ItemOfParams(ProviderMain providerMain,int index,context,ScrollController controller,int indexParamsHive){

  // bool visble = true;

  return GestureDetector(
    onDoubleTap: (){
      providerMain.initPremium(index);
      var name = Hive.box<Params>("params").get(indexParamsHive)!.name;
      var isPremium = "premium";
      var valuePro = Hive.box<Params>("params").get(indexParamsHive)!.valuePro;
      var color = Hive.box<Params>("params").get(indexParamsHive)!.color;
      var imageUrl = Hive.box<Params>("params").get(indexParamsHive)!.imageUrl;
      var id = Hive.box<Params>("params").get(indexParamsHive)!.id;
      Hive.box<Params>("params").putAt(indexParamsHive,Params(name: name, valuePro: valuePro, color: color, imageUrl: imageUrl, isPremium: isPremium, id: id));
    },
    child: Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          image: const DecorationImage(
              alignment: Alignment.topRight,
              image: AssetImage('assets/image/vector.png')
          ),
          color: providerMain.paramsList[index].color=='red'?
          Colors.red:providerMain.paramsList[index].color=='blue'?Colors.blue:
          providerMain.paramsList[index].color=='green'?Colors.green:
          providerMain.paramsList[index].color=='purpleAccent'?Colors.purpleAccent:Colors.red,
          borderRadius: BorderRadius.circular(8)
      ),
      child: Stack(
        children: [
          Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                alignment: Alignment.topLeft,
                child: Image.asset(providerMain.paramsList[index].imageUrl),
              )
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: Text(
                      providerMain.paramsList[index].name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 23
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                height: 7,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(163, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              ),
                            )
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: Text(
                            '${providerMain.paramsList[index].valuePro}%',
                            style: const TextStyle(
                                color: Colors.white
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          if (providerMain.paramsList[index].isPremium=='premium')  Expanded(
                child: GestureDetector(
                    onLongPress: (){
                      providerMain.exitPremiumOfIndex(index);
                      var name = Hive.box<Params>("params").get(indexParamsHive)!.name;
                      var isPremium = "notPremium";
                      var valuePro = Hive.box<Params>("params").get(indexParamsHive)!.valuePro;
                      var color = Hive.box<Params>("params").get(indexParamsHive)!.color;
                      var imageUrl = Hive.box<Params>("params").get(indexParamsHive)!.imageUrl;
                      var id = Hive.box<Params>("params").get(indexParamsHive)!.id;
                      Hive.box<Params>("params").putAt(indexParamsHive,Params(name: name, valuePro: valuePro, color: color, imageUrl: imageUrl, isPremium: isPremium, id: id));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(
                              207, 0, 0, 0
                          ),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Center(
                        child: Image.asset('assets/image/crown.png'),
                      ),
                    ),
                  ),
            ) else const SizedBox.shrink()
        ],
      ),
    ),
  );
}