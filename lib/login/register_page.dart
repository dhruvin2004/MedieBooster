import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../global.dart';
import 'loginpage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: FlutterLogo(
                    size: 180,
                    style: FlutterLogoStyle.stacked,
                    duration: Duration(seconds: 3),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),

                TextFormField(
                  controller: Global.emailController,
                  onChanged: (val) {
                    setState(() {
                      Global.email = val;
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
                    hintStyle: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),

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
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    hintText: "Password",
                    hintStyle: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),

                TextFormField(
                  controller: Global.confirmPassController,
                  onChanged: (val) {
                    setState(() {
                      Global.confirmPass = val;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    border: OutlineInputBorder(),
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () async{
                      SharedPreferences prefe = await SharedPreferences.getInstance();
                      setState(() {
                        if(Global.confirmPass == Global.password)
                        {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),

                          );
                          prefe.setString('email', Global.email);
                          prefe.setString('password', Global.password);
                          Navigator.pushReplacementNamed(context, 'login');
                        }else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Enter Same Password')));
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
                                color: Colors.grey.shade300,
                                offset: Offset(0, 5),
                                blurRadius: 20),
                          ]),
                      alignment: Alignment.center,
                      child: Text(
                        "Sign Up",
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
                      'I am member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        });
                      },
                      child: const Text(
                        'Log in',
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
