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
                  style: TextStyle(color: Colors.grey.shade600),
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
                    hintText: "Email",
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.w500),
                    hintStyle: TextStyle(
                        color: Colors.grey.shade600, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.grey.shade600),
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
                        color: Colors.grey.shade600, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showDialog(context: context, builder: (context)=> ForgotPassword(),);
                        });
                      },
                      child: const Text(
                        'Forgot Password ?',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
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
                      style: TextStyle(color: Colors.grey.shade600),
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


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Forgot Password"),
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextFormField(
              controller: Global.passController,
              onChanged: (val) {
                setState(() {
                  Global.password = val;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Forgot Password",
                border: OutlineInputBorder(),
                hintText: "Forgot Password",
                hintStyle: TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(onPressed: ()async{
                  SharedPreferences prefe = await SharedPreferences.getInstance();
                  setState(() {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Password Chane Successfully')));
                    prefe.setString('password', Global.password);
                    Navigator.pop(context);
                  });
                },child: Text("Save",style: TextStyle(color: Colors.white),),color: Colors.blue,),
                OutlinedButton(onPressed: (){
                  setState(() {

                    Navigator.pop(context);
                  });
                },child: Text("Cancal",style: TextStyle(color: Colors.black),),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
