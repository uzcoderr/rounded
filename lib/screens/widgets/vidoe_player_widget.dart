import 'package:flutter/material.dart';
import 'package:rounded/architecture/provider_main.dart';
import 'package:video_player/video_player.dart';

Widget VideoOfPlayer(VideoPlayerController controller,ProviderMain providerMain,context) {



  return Container(
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue
          ),
          margin: const EdgeInsets.all(15),
          width: double.infinity,
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: VideoPlayer(
              controller
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15)
            ),
            width: double.infinity,
            height: 200,
            margin: const EdgeInsets.all(15),
            child: Column(
              children:  [
                Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
                      ),
                    )
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    width: double.infinity,
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                              'How to speak like a native',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.all(15),
                          child: GestureDetector(
                            onTap: (){
                              providerMain.videoController();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('clicked'))
                              );
                            },
                            child: const Icon(
                                Icons.play_circle,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}