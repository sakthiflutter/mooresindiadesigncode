import 'package:flutter/material.dart';
import 'package:moorse_india_user/app/modules/home/view/my_navigation_page.dart';
import 'package:moorse_india_user/app/modules/indroduction/intro_1_screen.dart';
import 'package:moorse_india_user/app/modules/indroduction/intro_2_screen.dart';
import 'package:moorse_india_user/app/modules/indroduction/intro_3_screen.dart';
import 'package:moorse_india_user/app/modules/indroduction/intro_4_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  bool onFirstPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 3);
                onFirstPage = (index == 0);
              });
            },
            children: const [
              introScreen1(),
              IntroScreen2(),
              IntroScreen3(),
              IntroScreen4(),
            ],
          ),
          Container(
              alignment: Alignment(0, -.85),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  onFirstPage
                      ? SizedBox()
                      : InkWell(
                          onTap: () {
                            _controller.previousPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: Image.asset('assets/images/back_button.png',scale: 2,)),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: ((context) => MyNavigationPage())));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Text(
                          'Skip',style: TextStyle(color: onFirstPage?Colors.black: Colors.white),
                        ),
                      )),
                ],
              )),
          Container(
              alignment: Alignment(0, .85),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  
                  SmoothPageIndicator(
                    count: 4,
                    controller: _controller,
                  ),
                  SizedBox(height: 10,),
                  onLastPage
                      ? InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        MyNavigationPage())));
                          },
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.grey),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Done',style: TextStyle(color: Colors.white)),
                            )))
                      : InkWell(
                          onTap: () {
                            _controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: Container( decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.grey),child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Next',style: TextStyle(color: Colors.white)),
                          ))),
                          SizedBox(height: 10,)
                ],
              ))
        ],
      ),
    );
  }
}
