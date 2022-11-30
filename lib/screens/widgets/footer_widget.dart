import 'package:flutter/material.dart';
import 'package:rounded/architecture/provider_main.dart';

Widget HomeWorkWidget(ProviderMain providerMain,context){
  return GestureDetector(
    onDoubleTap: (){
      providerMain.initPremiumOfHomeWork();
    },
    child: Container(
      height: 150,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          image: const DecorationImage(
              alignment: Alignment.topRight,
              image: AssetImage('assets/image/vector.png')
          ),
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(8)
      ),
      child: Stack(
        children: [
          Expanded(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.topLeft,
                    // child: Image.asset('providerMain.paramsList[index].imageUrl'),
                    child: const Text(
                        'HomeWork',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    alignment: Alignment.topLeft,
                    // child: Image.asset('providerMain.paramsList[index].imageUrl'),
                    child: const FittedBox(
                      child: Padding(
                        padding: EdgeInsets.only(right: 18.0),
                        child: Text(
                          'Bu joyda barcha ishtirokchilar \ndarajalari bilan tanushing',
                          maxLines: 2,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
                        const Padding(
                          padding: EdgeInsets.only(right: 18.0),
                          child: Text(
                            '0%',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                        const Expanded(child: SizedBox.shrink())
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          if (providerMain.homeWork!.isPremium=='premium')  Expanded(
              child: GestureDetector(
                child: GestureDetector(
                  onLongPress: (){
                    providerMain.exitPremiumOfHomeWork();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(providerMain.homeWork!.isPremium)));
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