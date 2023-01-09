import 'package:flutter/material.dart';
import 'package:music_player/login/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../global.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff122950), Color(0xff4c7fce)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                SizedBox(
                  height: 100,
                ),
                Center(
                  child: FlutterLogo(
                    size: 180,
                    style: FlutterLogoStyle.stacked,
                    textColor: Colors.white,
                    duration: Duration(seconds: 3),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: Global.EmailController,
                  onChanged: (val) {
                    setState(() {
                      Global.Email = val;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    hintText: "Email",
                    labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                    hintStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: Global.PasswordController,
                  onChanged: (val) {
                    setState(() {
                      Global.Password = val;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    hintText: "Password",
                    hintStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      SharedPreferences prefe =
                          await SharedPreferences.getInstance();
                      setState(() {
                        if (prefe.getString('email').toString() == Global.Email &&
                            prefe.getString('password').toString() ==
                                Global.Password) {
                          Global.isLogin = true;
                          prefe.setBool('loginIs', Global.isLogin);
                          Navigator.pushReplacementNamed(context, 'home');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Invalid email & password'),
                            ),
                          );
                        }
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 5),
                                blurRadius: 20),
                          ]),
                      alignment: Alignment.center,
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()));
                        });
                      },
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
