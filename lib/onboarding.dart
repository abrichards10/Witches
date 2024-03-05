// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:witch_unite/home.dart';
import 'package:witch_unite/prefshelper.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  List<bool> isSelectedListInterests =
      List.generate(interests.length, (index) => false);
  List<String> thisInterestsList = []; // Initialize list here

  @override
  void initState() {
    super.initState();
    // Retrieve saved interests from PrefsHelper
    thisInterestsList = PrefsHelper().savedInterests;
    // Update isSelectedListInterests based on saved interests
    for (int i = 0; i < interests.length; i++) {
      isSelectedListInterests[i] = thisInterestsList.contains(interests[i]);
    }
  }

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return IntroductionScreen(
      key: introKey,
      allowImplicitScrolling: true,
      autoScrollDuration: 1000000000, //3000,
      infiniteAutoScroll: true,
      globalBackgroundColor: Color(0xFFE9DEFC),
      globalFooter: Container(
        width: double.infinity,
        height: 50,
        color: Color(0xFFE9DEFC),
        margin: EdgeInsets.fromLTRB(
          40,
          0,
          40,
          60,
        ),
        child: ElevatedButton(
          child: const Text(
            'Let\'s go!',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => _onIntroEnd(context),
        ),
      ),
      pages: [
        PageViewModel(
          image: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
            child: Image.asset(
              'assets/Welcome_Pic.png',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
          ),
          title: "~Welcome to Witch Trials!~",
          body: "Make acquaintances with fellow witches \n🔮",
          decoration: PageDecoration(
            pageMargin: EdgeInsets.fromLTRB(0, 80, 0, 0),
            pageColor: Color(0xFFE9DEFC),
          ),
        ),
        PageViewModel(
          title: "Create a Profile!",
          body:
              "Express yourself! Create a profile that reflects your interests, hobbies, and what mischief you're up to...",
          image: Image.asset(
            'assets/profile_pic.png',
            fit: BoxFit.fitHeight,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          decoration: PageDecoration(
            pageMargin: EdgeInsets.fromLTRB(0, 80, 0, 0),
            pageColor: Color(0xFFE9DEFC),
          ),
        ),
        PageViewModel(
          title: "Swipe and Save!",
          body:
              "Swipe right to connect with kindred spirits, or left to gracefully pass. Send an owl as a compliment! Your next magical connection is just a swipe away!",
          image: Image.asset(
            'assets/SwipeExample.png',
            fit: BoxFit.fitHeight,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          decoration: PageDecoration(
            pageMargin: EdgeInsets.fromLTRB(0, 100, 0, 0),
            pageColor: Color(0xFFE9DEFC),
          ),
        ),
        PageViewModel(
          title: "Group Hangouts!",
          body:
              "Experience the magic of group hangouts! Arrange gatherings with matched users to expand your circle and embark on new adventures together.",
          image: Image.asset(
            'assets/SwipeExample.png',
            fit: BoxFit.fitHeight,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          decoration: PageDecoration(
            pageMargin: EdgeInsets.fromLTRB(0, 100, 0, 0),
            pageColor: Color(0xFFE9DEFC),
          ),
        ),
        PageViewModel(
          title: "Set your interests!",
          body: "Let us know what you'd like to explore",
          image: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.fromLTRB(
                20,
                0,
                20,
                20,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(
                    255,
                    66,
                    37,
                    117,
                  ),
                  width: 4,
                ),
                borderRadius: BorderRadius.all(Radius.circular(43)),
              ),
              padding: EdgeInsets.fromLTRB(
                20,
                40,
                20,
                30,
              ),
              child: Wrap(
                spacing: 5,
                direction: Axis.horizontal,
                children: List.generate(interests.length, (index) {
                  return TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: isSelectedListInterests[index]
                          ? Color.fromARGB(255, 207, 187, 224)
                          : Color.fromARGB(255, 242, 223, 254),
                      padding: EdgeInsets.fromLTRB(
                        screenWidth * .02,
                        0,
                        screenWidth * .02,
                        0,
                      ),
                      elevation: 3,
                      shadowColor: Colors.deepPurple,
                      side: BorderSide(
                        width: 2,
                        color: isSelectedListInterests[index]
                            ? Color.fromARGB(255, 111, 93, 135)
                            : Color.fromARGB(255, 177, 151, 199),
                      ),
                    ),
                    child: Text(
                      interests[index],
                      style: TextStyle(
                        fontSize: screenWidth * .04,
                      ),
                    ),
                    onPressed: () {
                      if (isSelectedListInterests[index]) {
                        thisInterestsList.remove(interests[index]);
                      } else {
                        thisInterestsList.add(interests[index]);
                      }

                      isSelectedListInterests[index] =
                          !isSelectedListInterests[index];
                      PrefsHelper().savedInterests = thisInterestsList;
                      print("Interests ${PrefsHelper().savedInterests}");
                      setState(() {});
                    },
                  );
                }),
              ),
            ),
          ),
          decoration: PageDecoration(
            pageMargin: EdgeInsets.fromLTRB(0, 100, 0, 0),
            pageColor: Color(0xFFE9DEFC),
          ),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          )),
      next: const Icon(
        Icons.arrow_forward,
        color: Colors.white,
      ),
      done: const Text('Done',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          )),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
