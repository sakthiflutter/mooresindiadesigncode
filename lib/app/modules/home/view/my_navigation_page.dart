import 'package:flutter/material.dart';
import 'package:moorse_india_user/app/modules/cart/view/cart_page.dart';
import 'package:moorse_india_user/app/modules/category/view/category_page.dart';
import 'package:moorse_india_user/app/modules/home/view/home_page.dart';
import 'package:moorse_india_user/app/modules/profile/view/profile_page.dart';
import 'package:moorse_india_user/app/modules/wishlist/view/wishlist_page.dart';

class MyNavigationPage extends StatefulWidget {
  const MyNavigationPage({super.key});

  @override
  State<MyNavigationPage> createState() => _MyNavigationPageState();
}

class _MyNavigationPageState extends State<MyNavigationPage> {
  int index = 0;
  List pages = [
    HomePage(),
    CategoryPage(),
    CartPage(isfromNavBar: true,),
    WishlistPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        backgroundColor: const Color.fromARGB(255, 244, 86, 139),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(100),
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
                topLeft: Radius.circular(100))),
        onPressed: () {
           setState(() {
                  index = 0;
                });
        },
        child:  Icon(
          Icons.home_outlined,
          color:index==0?Colors.white: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 16,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 60,
        color: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.grey,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon:Column(children:[index==1?Image.asset('assets/images/Layer_2.png',scale:5):Image.asset('assets/images/layer.png',scale:1.2),
              Text('category',style: TextStyle(color:index==1?Colors.pink: Colors.black,fontSize: 9 ),) ]),
             
              onPressed: () {
                setState(() {
                  index = 1;
                });
                
              },
            ),
            IconButton(
              icon:  Column(
                children: [
                  Image.asset('assets/images/Vector-1.png',scale:4.5 ,color:index==2?Colors.pink: Colors.black,),
                   Text('cart',style: TextStyle(color:index==2?Colors.pink: Colors.black,fontSize: 9 ),)
                ],
              ),
              onPressed: () {
                  setState(() {
                  index = 2;
                });
              },
            ),
            SizedBox(width: 10,),
            IconButton(
              icon:  Column(
                children: [
                  Image.asset('assets/images/Vector.png',scale:4,color:index==3?Colors.pink: Colors.black,),
                    Text('favarite',style: TextStyle(color:index==3?Colors.pink: Colors.black,fontSize: 9 ),)
                ],
              ),
              onPressed: () {
                 setState(() {
                  index = 3;
                });
              },
            ),
            IconButton(
              icon:   Column(
                children: [
                  Image.asset('assets/images/Layer_2-1.png',scale:4,color:index==4?Colors.pink: Colors.black,),
                    Text('profile',style: TextStyle(color:index==4?Colors.pink: Colors.black,fontSize: 9 ),)
                ],
              ),
              onPressed: () {
                  setState(() {
                  index = 4;
                });
              },
            ),
          ],
        ),
      ),
      body: pages[index],
    );
  }
}
