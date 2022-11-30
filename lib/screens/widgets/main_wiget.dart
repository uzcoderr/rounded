import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rounded/architecture/provider_main.dart';
import 'package:rounded/screens/downloader_screen.dart';
import 'package:rounded/service/network/api_service.dart';

Widget MainOfBody(context, ProviderMain providerMain) {
  PermissionStatus _permissionStatus = PermissionStatus.denied;

  Future<void> askStoragePermission() async {
    await Permission.storage.request();
    debugPrint(" ---------------- Asking for permission...");
    await Permission.manageExternalStorage.request();
    if (await Permission.manageExternalStorage.request().isGranted) {
      PermissionStatus permissionStatus =
          await Permission.manageExternalStorage.status;

      _permissionStatus = permissionStatus;
      // notifyListeners();
    }
  }

  void image(){
    ApiService().getRandomImage().then((value) => {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          actions: [
            ElevatedButton(
                onPressed: () {

                },
                child: const Text('Toxtatish !')
            )
          ],
          title: Text('Siz Uchun Rasimlar '),
          content: value!=null ? Image.network(value):const CircularProgressIndicator(),
        )
      )
    });
  }

  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Image.asset(fit: BoxFit.cover, 'assets/image/img1.png'),
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
                      style: TextStyle(color: Colors.black, fontSize: 20),
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
        padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shadowColor: Colors.transparent,
                      side: const BorderSide(color: Colors.blue),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                      image();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Saqlab qo’yish',
                      style: TextStyle(color: Colors.blue),
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
                      side: const BorderSide(color: Colors.white),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () async {
                    var isGrant = await Permission.storage.isGranted;
                    if (!isGrant) {
                      await askStoragePermission();
                    } else {
                      Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (context) {
                              return const DownloaderScreen();
                            },
                          )
                      );
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Yuklab Olish',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(left: 18.0, right: 18, top: 10),
        child: Divider(),
      )
    ],
  );
}
