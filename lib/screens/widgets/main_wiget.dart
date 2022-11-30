import 'package:flutter/material.dart';
import 'package:rounded/architecture/provider_main.dart';
import 'package:rounded/service/local/premium_controller.dart';

Widget MainOfBody(context,ProviderMain providerMain){

  return Column(
    children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Image.asset(
                    fit: BoxFit.cover,
                    'assets/image/img1.png'
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                        'Lesson 2',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FittedBox(
                      child: Text(
                          'How to talk about nation \nAsilbek Asqarov Asilbek',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      Container(
        padding: const EdgeInsets.only(top: 5, left: 5,right: 5),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shadowColor: Colors.transparent,
                    side: const BorderSide(
                      color: Colors.blue
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    )
                  ),
                  onPressed: (){
                    // for(var obj in providerMain.paramsList){
                    //   providerMain.startHive(obj,providerMain.homeWork);
                    // }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                        'Saqlab qo’yish',
                      style: TextStyle(
                        color: Colors.blue
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shadowColor: Colors.transparent,
                      side: const BorderSide(
                          color: Colors.white
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      )
                  ),
                  onPressed: () async{
                    await providerMain.askStoragePermission();
                    await providerMain.startDownloading();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      'Yuklab Olish ${providerMain.progress.toString()}',
                      style: const TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
     const Padding(
       padding: EdgeInsets.only(left: 18.0,right: 18,top: 10),
       child: Divider(),
     )
    ],
  );

}