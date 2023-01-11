import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

import '../global.dart';

class MusicList extends StatefulWidget {
  const MusicList({Key? key}) : super(key: key);

  @override
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Music Player"),
        backgroundColor: Color(0xff122950),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(

          padding: EdgeInsets.all(16),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff122950), Color(0xff4c7fce)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              StaggeredGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: Global.song.map((e) {
                  return StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: e['height'],
                    child: GestureDetector(
                      onTap: () {
                        Global.musicIndex = Global.song.indexOf(e);
                        Navigator.pushNamed(context, 'musiclist',);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Image.asset(
                                  e['image'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  e['name'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class Music extends StatefulWidget {
  const Music({Key? key}) : super(key: key);

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  @override
  void initState() {
// TODO: implement initState
    super.initState();
    assetsAudioPlayer.open(
      Audio('${Global.song[Global.musicIndex]['path']}'),
      autoStart: true,
      showNotification: true,
    );
    assetsAudioPlayer.currentPosition.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
    assetsAudioPlayer.current.listen((totalDuration) {
      setState(() {
        duration = totalDuration!.audio.duration;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        height: height,
        width: width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff122950), Color(0xff4c7fce)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Row(
              children: [
                GestureDetector(onTap: (){setState(() {
                  Navigator.pop(context);
                });},child: Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
                SizedBox(width: 25,),
                Center(
                  child: Text(
                    Global.song[Global.musicIndex]['name'],
                    style: TextStyle(
                      color: CupertinoColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 10,
              child: Container(
                height: 350,
                width: 350,
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    Global.song[Global.musicIndex]['image'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Text(
              Global.song[Global.musicIndex]['name'],
              style: const TextStyle(
                color: CupertinoColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 10),

            const Spacer(),
            SliderTheme(
              data: const SliderThemeData(
                trackHeight: 1.5,
                thumbShape: RoundSliderThumbShape(
                    disabledThumbRadius: 0, enabledThumbRadius: 8),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 0),
              ),
              child: Slider(
                activeColor: const Color(0xFFECC1CE),
                inactiveColor: const Color(0xFFB45F86),
                thumbColor: const Color(0xFFFEFFFE),
                value: position.inSeconds.toDouble(),
                max: duration.inSeconds.toDouble(),
                onChanged: (double value) async {
                  await assetsAudioPlayer
                      .seek(Duration(seconds: value.toInt()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${position.inMinutes.remainder(60)} : ${position.inSeconds.remainder(60)}",
                    style: const TextStyle(
                      color: CupertinoColors.white,
                    ),
                  ),
                  Text(
                    "${duration.inMinutes.remainder(60)} : ${duration.inSeconds.remainder(60)}",
                    style: const TextStyle(
                      color: CupertinoColors.white,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (Global.musicIndex > 0) {
                        Global.musicIndex--;
                        assetsAudioPlayer.open(
                          Audio('${Global.song[Global.musicIndex]['path']}'),
                          autoStart: true,
                          showNotification: true,
                        );
                      }
                    });
                  },
                  child: const Icon(
                    CupertinoIcons.backward_fill,
                    color: CupertinoColors.white,
                    size: 40,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      assetsAudioPlayer.playOrPause();
                    });
                  },
                  child: Icon(
                    assetsAudioPlayer.isPlaying.value
                        ? CupertinoIcons.play_arrow_solid
                        : CupertinoIcons.pause,
                    color: CupertinoColors.white,
                    size: 40,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (Global.musicIndex < Global.song.length - 1) {
                        Global.musicIndex++;
                        assetsAudioPlayer.open(
                          Audio('${Global.song[Global.musicIndex]['path']}'),
                          autoStart: true,
                          showNotification: true,
                        );
                      }
                    });
                  },
                  child: const Icon(
                    CupertinoIcons.forward_fill,
                    color: CupertinoColors.white,
                    size: 40,
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
