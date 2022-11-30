import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:rounded/architecture/provider_main.dart';
import 'package:rounded/screens/widgets/appbar_widget.dart';
import 'package:rounded/screens/widgets/footer_widget.dart';
import 'package:rounded/screens/widgets/list_of_params.dart';
import 'package:rounded/screens/widgets/main_wiget.dart';
import 'package:rounded/screens/widgets/vidoe_player_widget.dart';
import 'package:rounded/service/network/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ProviderMain providerMain = ProviderMain();
  var db = Hive.box("image");

  void showRandomImage(){
    ApiService().getRandomImage().then((value) => {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            actions: [
              ElevatedButton(
                  onPressed: () {
                    db.put("img", "stop");
                  },
                  child: const Text('Toxtatish !')
              )
            ],
            title: const Text('Siz Uchun Rasimlar '),
            content: value!=null ? Image.network(value):const CircularProgressIndicator(),
          )
      )
    });
  }

  @override
  void initState() {
    providerMain.initVideo();
    providerMain.initApp();
    providerMain.startHive();
    var s = db.get("img");
    if(db!=null){
      var s = db.get("img");
      if(s=="true"){
        showRandomImage();
      }
    }else{
      db.put("img", "true");
      if(s=="true"){
        showRandomImage();
      }
    }
    super.initState();
  }

  @override
  void dispose() {
    providerMain.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> providerMain,
      child: Consumer<ProviderMain>(
        builder: (context,value,child) => Scaffold(
          backgroundColor: Colors.white,
          appBar: MainOfAppBar('ROUNDED TASK'),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()
            ),
            child: Column(
              children: [
                MainOfBody(context,providerMain),
                VideoOfPlayer(providerMain.controller,providerMain,context),
                ListOfParams(providerMain,context),
                HomeWorkWidget(providerMain,context)
                // controller.value.isInitialized ? SizedBox(width: double.infinity,height: 500,  child: VideoPlayer(controller)) : const CircularProgressIndicator()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
