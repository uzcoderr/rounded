
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rounded/model/param.dart';
import 'package:rounded/model/homework.dart';
import 'package:rounded/service/local/premium_controller.dart';
import 'package:rounded/service/network/api_service.dart';
import 'package:video_player/video_player.dart';

class ProviderMain extends ChangeNotifier {
  late VideoPlayerController controller;

  Dio dio = Dio();

  HomeWork homeWork = HomeWork(title: "HomeWork", caption: "Bu joyda barcha ishtirokchilar \ndarajalari bilan tanushing", valuePro: 0, isPremium: "premium");

  List<Params> paramsList = [];

  Future startHive() async{
    await ApiService().GET_PARMS_INFO().then((value) => {
      for(var param in value){
        PremiumControllerDb().save(param),
        notifyListeners()
      }
    });
    // await PremiumCont.rollerDb().saveObjParam2(params2);
  }

  Future _getFilePath(String fileName) async {

    final dir = await getApplicationDocumentsDirectory();

    return "${dir.path}$fileName";

  }

  Future exitPremiumOfHomeWork() async{
    homeWork.isPremium = "notPremium";
    notifyListeners();
  }

  Future initPremiumOfHomeWork() async{
    homeWork.isPremium = "premium";
    notifyListeners();
  }

  // Future getHomeWorkInfo()async{
  //
  // }

  Future initApp() async {
    ApiService().GET_PARMS_INFO().then(
        (value) => { paramsList = value.cast<Params>(), notifyListeners()});
  }

  Future initVideo() async {
    controller = VideoPlayerController.network(
        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4')
      ..addListener(() {
        notifyListeners();
      })
      ..setLooping(true)
      ..initialize().then((value) => {
        notifyListeners()
      });
  }

  Future exitPremiumOfIndex(int index) async {
    paramsList[index].isPremium = "noPremium";
    notifyListeners();
  }

  Future initPremium(int index) async{
    paramsList[index].isPremium = "premium";
    notifyListeners();
  }

  Future videoController() async {
    if (controller.value.isPlaying) {
      controller.pause();
    } else {
      controller.play();
    }
  }

  Future playVideo() async {
    controller.play();
    controller = VideoPlayerController.network(
      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

    controller.addListener(() {
      notifyListeners();
    });

    controller.setLooping(true);
    controller.initialize();
  }

  double progress = 0.0;

  Future startDownloading() async {

    const String url = "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4";

    const String fileName = "video.mp4";

    String path = await _getFilePath(fileName);

    await dio.download(
      url,
      path,
      onReceiveProgress: (rByte, totalByte) {
        progress = rByte / totalByte;
        notifyListeners();
      },
      deleteOnError: true,
    ).then((value) => {
      print(path)
    });
  }

  PermissionStatus _permissionStatus = PermissionStatus.denied;

  Future<void> askStoragePermission() async {
    debugPrint(" ---------------- Asking for permission...");
    await Permission.manageExternalStorage.request();
    if (await Permission.manageExternalStorage.request().isGranted) {
      PermissionStatus permissionStatus =
      await Permission.manageExternalStorage.status;

        _permissionStatus = permissionStatus;
      notifyListeners();
    }
  }
}
