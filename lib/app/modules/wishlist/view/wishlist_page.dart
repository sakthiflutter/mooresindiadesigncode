import 'package:flutter/material.dart';
import 'package:moorse_india_user/app/modules/product_details/view/product_details_page.dart';
import 'package:moorse_india_user/core/app_color.dart';

class WishlistPage extends StatelessWidget {
   WishlistPage({super.key});

  List<String> catImgList = [
    'assets/remove/Her1.jpg',
    'assets/remove/Him 2.jpg',
    'assets/remove/home.png',
    'assets/remove/image.jpg',
    'assets/remove/kids.jpg',
    'assets/remove/USPAHanes.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(surfaceTintColor: AppColor.whiteColor,title:const Text('My wishlist'),),
      
      body:GridView.builder(
        // physics: NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            childAspectRatio: .65,
            crossAxisCount: 2),
        itemCount: catImgList.length + 2,
        itemBuilder: (context, index) {
          if (index < catImgList.length) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      ProductDetailsPage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(0.0, 1.0);
                    const end = Offset.zero;
                    const curve = Curves.ease;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));

                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                ));
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  children: [
                    Container(
                      width: 150,
                      height: 190,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: AppColor.appbarBackColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade500,
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(
                                  3, 3), // changes position of shadow
                            ),
                          ],
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(catImgList[index]))),
                      child: Stack(
                        children: [
                          Align(
                            alignment: const Alignment(0, 1),
                            child: Container(
                                width: double.infinity,
                                height: 30,
                                color: Colors.black.withOpacity(0.5),
                                child: const Center(
                                    child: Text(
                                  'Stylease Exclusive',
                                  style: TextStyle(color: AppColor.whiteColor),
                                ))),
                          )
                        ],
                      ),
                    ),
                    const Text('Stylease Exclusive'),
                    RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: '₹5000',
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.red)),
                      TextSpan(
                          text: ' ₹2000',
                          style: TextStyle(color: Colors.green)),
                      TextSpan(
                          text: '\nOFF 60%',
                          style: TextStyle(color: Colors.green))
                    ])),
                    const Text('Lowest Price in last 30 days',
                        style: TextStyle(color: Colors.green, fontSize: 9)),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }) ,
    );
  }
}
//git add 
