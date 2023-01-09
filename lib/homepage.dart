import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/video_player/videoplayer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Media Booster"),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(),
                    );
                  });
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),)
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff122950), Color(0xff4c7fce)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ListView(

            padding: const EdgeInsets.all(16),
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, 'grid');
                    },
                child: Container(
                  height: 150,
                  width: w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 4),
                          blurRadius: 20,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 100,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/image/StaggeredGrid-300x300.jpg"))),
                      ),
                      const Text(
                        "Staggered Grid View",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=> const VideoList(),));
                  });
                },
                child: Container(
                  height: 150,
                  width: w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow:const [
                         BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 4),
                          blurRadius: 20,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 150,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/image/videoplyer.gif"))),
                      ),
                      const Text(
                        "Video Player",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),GestureDetector(
                onTap: (){
                  setState(() {
                    Navigator.pushNamed(context, 'music');
                  });
                },
                child: Container(
                  height: 150,
                  width: w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const[
                         BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 4),
                          blurRadius: 20,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 120,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/image/music.gif"))),
                      ),
                      const Text(
                        "Music Player",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ));
  }
}

class Dialog extends StatefulWidget {
  const Dialog({Key? key}) : super(key: key);

  @override
  State<Dialog> createState() => _DialogState();
}



class _DialogState extends State<Dialog> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
setState(() {

});
  }

  void LogOut()async{
    SharedPreferences prefe =
    await SharedPreferences.getInstance();
    Global.isLogin = false;
    prefe.setBool('loginIs', Global.isLogin);
    Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
  }
  @override
  Widget build(BuildContext context) {
    return  CupertinoAlertDialog(
      title: const Text("Are you sure for exit?"),
      actions: [
        GestureDetector(

          child: Container(
            alignment: Alignment.center,
            height: 40,
            child: const Text(
              "Yes",
              style: TextStyle(
                  color: Colors.black,
                  inherit: false,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),),
          onTap: (){
            setState(() {
              LogOut();
            });

          },
        ),
        GestureDetector(
          onTap:(){
            setState(() {
              Navigator.pop(context);
            });
          },
          child: Container(
            alignment: Alignment.center,
            height: 40,
            child: const Text(
              "No",
              style: TextStyle(
                  color: Colors.black,
                  inherit: false,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),),
        ),
      ],
    );
  }
}

