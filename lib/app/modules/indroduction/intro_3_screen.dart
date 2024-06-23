import 'package:flutter/material.dart';

class IntroScreen3 extends StatelessWidget {
  const IntroScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
       
     width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,

      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/images/Splash Screen-2.png'))
      ),
      
     
    );
  }
}