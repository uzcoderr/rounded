import 'package:flutter/material.dart';
import 'package:rounded/architecture/provider_main.dart';
import 'package:rounded/model/param.dart';

Widget ItemOfParams(ProviderMain providerMain,int index,context,ScrollController controller,Params params){

  // bool visble = true;

  return GestureDetector(
    onDoubleTap: (){
      providerMain.initPremium(index);
      controller.notifyListeners();
    },
    child: Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          image: const DecorationImage(
              alignment: Alignment.topRight,
              image: AssetImage('assets/image/vector.png')
          ),
          color: params.color=='red'?
          Colors.red:params.color=='blue'?Colors.blue:
          params.color=='green'?Colors.green:
          params.color=='purpleAccent'?Colors.purpleAccent:Colors.red,
          borderRadius: BorderRadius.circular(8)
      ),
      child: Stack(
        children: [
          Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                alignment: Alignment.topLeft,
                child: Image.asset(params.imageUrl),
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
                      params.name,
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
                  child: GestureDetector(
                    onLongPress: (){
                      providerMain.exitPremiumOfIndex(index);
                      controller.notifyListeners();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(providerMain.paramsList[index].isPremium)));
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
                )
            ) else const SizedBox.shrink()
        ],
      ),
    ),
  );
}