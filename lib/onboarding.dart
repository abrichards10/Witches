// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:witch_unite/home.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Color(0xFFE9DEFC),
      allowImplicitScrolling: true,
      autoScrollDuration: 1000000000, //3000,
      infiniteAutoScroll: true,
      // globalHeader: Align(
      //   alignment: Alignment.topRight,
      //   child: SafeArea(
      //     child: Padding(
      //       padding: const EdgeInsets.only(top: 16, right: 16),
      //       child: _buildImage('Witch_ICON.png', 100),
      //     ),
      //   ),
      // ),
      globalFooter: Container(
        width: double.infinity,
        height: 40,
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
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () => _onIntroEnd(context),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Welcome to Witch Trials!",
          body: "Make acquaintances with fellow wenches 🔮",
          image: Image.asset(
            'assets/Welcome_Pic.png',
            fit: BoxFit.cover,
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
          title: "Create a Profile!",
          body:
              "Express yourself! Create a profile that reflects your interests, hobbies, and what mischief you're up to making...",
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
        // PageViewModel(
        //   title: "Group Hangouts!",
        //   body:
        //       "Experience the magic of group hangouts! Arrange gatherings with matched users to expand your circle and embark on new adventures together.",
        //   image: _buildFullscreenImage(),
        //   decoration: pageDecoration.copyWith(
        //     contentMargin: const EdgeInsets.symmetric(horizontal: 16),
        //     fullScreen: true,
        //     bodyFlex: 2,
        //     imageFlex: 3,
        //     safeArea: 100,
        //   ),
        // ),
        // PageViewModel(
        //   title: "Another title page",
        //   body: "Another beautiful body text for this example onboarding",
        //   image: _buildImage('flutter.png'),
        //   footer: ElevatedButton(
        //     onPressed: () {
        //       introKey.currentState?.animateScroll(0);
        //     },
        //     style: ElevatedButton.styleFrom(
        //       backgroundColor: Colors.lightBlue,
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(8.0),
        //       ),
        //     ),
        //     child: const Text(
        //       'FooButton',
        //       style: TextStyle(color: Colors.white),
        //     ),
        //   ),
        //   decoration: pageDecoration.copyWith(
        //     bodyFlex: 6,
        //     imageFlex: 6,
        //     safeArea: 80,
        //   ),
        // ),
        // PageViewModel(
        // title: "Title of last page - reversed",
        // bodyWidget: const Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Text("Click on ", style: bodyStyle),
        //     Icon(Icons.edit),
        //     Text(" to edit a post", style: bodyStyle),
        //   ],
        // ),
        // decoration: pageDecoration.copyWith(
        //   bodyFlex: 2,
        //   imageFlex: 4,
        //   bodyAlignment: Alignment.bottomCenter,
        //   imageAlignment: Alignment.topCenter,
        // ),
        // image: _buildImage('flutter.png'),
        // reverse: true,
        // ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
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