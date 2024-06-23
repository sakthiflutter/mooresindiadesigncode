import 'package:flutter/material.dart';

class IntroScreen2 extends StatelessWidget {
  const IntroScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,

      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/images/Splash Screen-1.png'))
      ),
     
      // child: Image.asset('assets/images/Splash Screen-1.png')
      
     
    );
  }
}