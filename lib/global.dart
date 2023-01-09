import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
Duration position = Duration.zero;
Duration duration = Duration.zero;


class Global {

  // music player
  static int musicIndex = 0;
  // Login Page
  static bool isLogin = false;
  static String Email = "";
  static String Password = "";
  static TextEditingController EmailController = TextEditingController();
  static TextEditingController PasswordController = TextEditingController();

  // Register Page

  static String email = "";
  static String password = "";
  static String confirmPass = "";
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passController = TextEditingController();
  static TextEditingController confirmPassController = TextEditingController();

  //Intro Page

  static bool isIntro = false;

  static List videos = [
    {
      'image':
      'https://i.vimeocdn.com/video/1563215409-c4b17e53882a74d06e9a0b8c9fe22de7e4773899a17b9c7554bd40d87237cce3-d_640x360.jpg',
    'video':
    'https://cdn.pixabay.com/vimeo/778907198/Christmas%20-%20141964.mp4?width=640&hash=85c931219de800ff2e651bf0e82b092b6f6cc1f4',
    },
    {
      'image':
      'https://i.vimeocdn.com/video/1271763344-f891ebbcaa1456fda074e32457c1e1b975fa2048494bc92b0_640x360.jpg',
    'video':
    'https://cdn.pixabay.com/vimeo/629483574/Aurora%20Borealis%20-%2090877.mp4?width=960&hash=e3b680ed14a44dd77b91f4c628e775f546501865',
    },
    {
      'image':
      'https://i.vimeocdn.com/video/1278052549-1ca5bb7344b9674770d53ce6061d5840c402618741745a536_640x360.jpg',
    'video':
    'https://cdn.pixabay.com/vimeo/635675488/Mountains%20-%2091545.mp4?width=1280&hash=583fb2d1b01533ce77d3febc67a34b076a8d2d76',
    },
    {
      'image':
      'https://i.vimeocdn.com/video/1534871554-04395a9a937e020640cb9cf101527b1d647bfa4703fe35d55e9ccfc25a086f28-d_640x360.jpg',
    'video':
    'https://cdn.pixabay.com/vimeo/764361528/Ocean%20-%20135658.mp4?width=1280&hash=f64da4baec74c288939381fc4993230aa8589c80',
    },
    {
      'image':
      'https://i.vimeocdn.com/video/1008844994-6476435f2dcb0ec69f4dd8fa355fb3eb11d86420d0b985ebf6b26e7916172ba7-d_640x360.jpg',
    'video':
    'https://cdn.pixabay.com/vimeo/487508532/Woman%20-%2058142.mp4?width=640&hash=0d04483bca070b3a8567ac4120a2af09038319ab',
    },
    {
      'image':
      'https://i.vimeocdn.com/video/1279120270-b54608ac25c4d13ee159592a32ec7667545dcf4f5b88a6d00_640x360.jpg',
    'video':
    'https://cdn.pixabay.com/vimeo/636709154/Skyscrapers%20-%2091744.mp4?width=1280&hash=85febefab25ea65c28efc2a65df07ac41c8a35c0',
    },
  ];


  //music_player

  static List<Map<String,dynamic>> song = [
    {
      'name': 'Jadugar',
      'path': 'assets/mp3/Jadugar.mp3',
      'image': 'assets/photo/1.jpg',
      'height': 1.3,
    },
    {
      'name': 'Let Me Down Slowly x Main Dhoondne Ko Zamaane Mein',
      'path': 'assets/mp3/yt5s.com - Let Me Down Slowly x Main Dhoondne Ko Zamaane Mein (Gravero Mashup) _ Full Version (128 kbps).mp3',
      'image': 'assets/photo/2.jpg',
      'height': 1,
    },
    {
      'name': 'Darasal',
      'path': 'assets/mp3/Darasal.mp3',
      'image': 'assets/photo/3.jpg',
      'height': 1.2,
    },
    {
      'name': 'Tu Ake DekhLe',
      'path': 'assets/mp3/yt5s.com - King - Tu Aake Dekhle _ The Carnival _ The Last Ride _ Prod. by Shahbeatz _ Latest Hit Songs 2020 (128 kbps).mp3',
      'image': 'assets/photo/4.jpg',
      'height': 1.5,
    },
    {
      'name': 'Shayad',
      'path': 'assets/mp3/yt5s.com - Shayad - Love Aaj Kal _ Kartik _ Sara _ Arushi _ Pritam _ Arijit Singh (128 kbps).mp3',
      'image': 'assets/photo/5.jpg',
      'height': 1,
    },
    {
      'name': 'JAB TAK',
      'path': 'assets/mp3/yt5s.com - JAB TAK Full Video _ M.S. DHONI -THE UNTOLD STORY _ Armaan Malik, Amaal Mallik _Sushant Singh Rajput (128 kbps).mp3',
      'image': 'assets/photo/6.jpg',
      'height': 1.2,
    },
    {
      'name': 'Pehli Dafa',
      'path': 'assets/mp3/yt5s.com - Atif Aslam_ Pehli Dafa Song (Video) _ Ileana D’Cruz _ Latest Hindi Song 2017 _ T-Series (128 kbps).mp3',
      'image': 'assets/photo/7.jpg',
      'height': 1.4,
    },
    {
      'name': 'Maan Meri Jaan',
      'path': 'assets/mp3/yt5s.com - Maan Meri Jaan _ Official Music Video _ Champagne Talk _ King (128 kbps).mp3',
      'image': 'assets/photo/8.jpg',
      'height': 1.2,
    },
    {
      'name': 'Kesariya',
      'path': 'assets/mp3/yt5s.com - Kesariya - Brahmāstra _ Ranbir Kapoor _ Alia Bhatt _ Pritam _ Arijit Singh _ Amitabh Bhattacharya (128 kbps).mp3',
      'image': 'assets/photo/9.jpg',
      'height': 1.5,
    },
    {
      'name': 'Oops',
      'path': 'assets/mp3/yt5s.com - Yaariyan Love Me Thoda Aur Full Video Song _ Arijit Singh _ Himansh Kohli, Rakul Preet _ Pritam (128 kbps).mp3',
      'image': 'assets/photo/10.jpg',
      'height': 1.4,
    },

  ];

}
