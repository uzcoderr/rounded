import 'package:flutter/material.dart';
import 'package:rounded/architecture/provider_main.dart';

class DownloaderScreen extends StatefulWidget {
  const DownloaderScreen({Key? key}) : super(key: key);

  @override
  State<DownloaderScreen> createState() => _DownloaderScreenState();
}

class _DownloaderScreenState extends State<DownloaderScreen> {

  ProviderMain providerMain = ProviderMain();

  @override
  void initState() {
    super.initState();
  }

  Future start() async{
    providerMain.startDownloading().then((value) => {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('ok'))),
      Navigator.pop(context),
    //  +998 95 818 10 84
    });
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: ElevatedButton(
        onPressed: (){
          start();
        },
        child: const Text('data'),
      ),
    ));
  }
}
