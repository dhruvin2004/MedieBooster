import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'global.dart';
import 'homepage.dart';


class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  final PageController _pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: OnBoard(
        pageController: _pageController,
        onSkip: () async{
          SharedPreferences preferences = await SharedPreferences.getInstance();
          Global.isIntro = true;
          preferences.setBool('bool', Global.isIntro);
          Navigator.pushReplacementNamed(context, 'login');

        },

        imageHeight: 400,
        imageWidth: 300,
        onBoardData: const [
          OnBoardModel(
            title: "Set your own goals and get better",
            description:
            "Goal support your motivation and inspire you to work harder",
            imgUrl: "assets/image/1.jpg",
          ),
          OnBoardModel(
            title: "Track your progress with statistics",
            description:
            "Analyse personal result with detailed chart and numerical values",
            imgUrl: 'assets/image/2.jpg',
          ),
          OnBoardModel(
            title: "Create photo comparision and share your results",
            description:
            "Take before and after photos to visualize progress and get the shape that you dream about",
            imgUrl: 'assets/image/3.jpg',
          ),
        ],
        titleStyles: const TextStyle(
          color: Color(0xff4e7fce),
          fontSize: 18,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.15,
        ),
        descriptionStyles: TextStyle(
          fontSize: 16,
          color: Color(0xffbfcbff),
        ),
        pageIndicatorStyle: const PageIndicatorStyle(
          width: 100,
          inactiveColor: Color(0xff4d7ecd),
          activeColor: Color(0xff122a4e),
          inactiveSize: Size(8, 8),
          activeSize: Size(12, 12),
        ),
        // Either Provide onSkip Callback or skipButton Widget to handle skip state
        skipButton: TextButton(
          onPressed: ()async {
            SharedPreferences preferences = await SharedPreferences.getInstance();


            Global.isLogin = true;
            preferences.setBool('bool', Global.isLogin);
            Navigator.pushReplacementNamed(context, 'login');
          },
          child: const Text(
            "Skip",
            style: TextStyle(
              color: Color(0xff4c7fce),
            ),
          ),
        ),
        nextButton: OnBoardConsumer(
          builder: (context, ref, child) {
            final state = ref.watch(onBoardStateProvider);
            return state.isLastPage
                ? InkWell(
              onTap: () async{
                SharedPreferences preferences = await SharedPreferences.getInstance();

                Global.isLogin = true;
                preferences.setBool('bool', Global.isLogin);
                Navigator.pushReplacementNamed(context, 'login');

              },
              child: Container(
                width: 230,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff122950),
                      Color(0xff4c7fce),
                    ],
                  ),
                ),
                child: const Text(
                  "Done",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
                : InkWell(
              onTap: () {
                _onNextTap(state);
              },
              child: Container(
                width: 230,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [Color(0xff122950), Color(0xff4c7fce)],
                  ),
                ),
                child: Text(
                  "Next",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _onNextTap(OnBoardState onBoardState) {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {}
  }
}
