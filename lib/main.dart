

import 'package:flutter/material.dart';
import 'package:music_player/grid_view/grid.dart';
import 'package:music_player/music/musicplayer.dart';
import 'package:music_player/video_player/videoplayer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homepage.dart';
import 'intro.dart';
import 'login/loginpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(

          backgroundColor :Color(0xff122950),
          centerTitle: true,
          elevation: 0,
        ),
      ),
      initialRoute: (preferences.getBool('bool') == true)
          ? (preferences.getBool('loginIs') == true)
              ? 'home'
              : 'login'
          : '/',
      //initialRoute: '/',
      routes: {
        '/': (context) => IntroScreen(),
        'home': (context) => HomePage(),
        'login': (context) => LoginPage(),
        'grid': (context) => gridView(),
        'music': (context) => MusicList(),
        'musiclist': (context) => Music(),
      },
    ),
  );
}
