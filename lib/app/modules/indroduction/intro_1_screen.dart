import 'package:flutter/material.dart';

class introScreen1 extends StatelessWidget {
  const introScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/8,
      
      child: Image.asset('assets/images/logo.png',scale:5 ,)
    );
    
  }
}
