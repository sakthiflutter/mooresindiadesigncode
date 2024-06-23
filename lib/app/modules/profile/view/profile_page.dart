import 'package:flutter/material.dart';
import 'package:moorse_india_user/app/modules/profile/view/profile_edit_page.dart';
import 'package:moorse_india_user/core/app_color.dart';
import 'package:moorse_india_user/core/app_helper.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        surfaceTintColor: AppColor.whiteColor,
        title: Text('Profile'),
        centerTitle: true,
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      ProfileEditPage(),
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
              child: Row(
                children: [Icon(Icons.edit), Text('Edit')],
              ))
        ],
      ),
      // body: SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         CircleAvatar(
      //           backgroundImage: AssetImage('assets/images/man 1.png'),
      //           radius: 40.0,
      //         ),
      //         Container(
      //           width: double.infinity,
      //           decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(AppHelper.buttonRadius),
      //               color: Colors.white),
      //           child: Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: Table(
      //               children: [
      //                 TableRow(children: [
      //                   Text(
      //                     'Name',
      //                     style: TextStyle(fontSize: AppHelper.titleFontSize),
      //                   ),
      //                   Text(
      //                     'Suhail Anvar',
      //                     style: TextStyle(fontSize: AppHelper.titleFontSize),
      //                   )
      //                 ]),
      //                 TableRow(children: [
      //                   Text(
      //                     'Email-ID',
      //                     style: TextStyle(fontSize: AppHelper.titleFontSize),
      //                   ),
      //                   Text(
      //                     'Suhail Anvar@gmail.com',
      //                     style: TextStyle(fontSize: AppHelper.titleFontSize),
      //                   )
      //                 ]),
      //                 TableRow(children: [
      //                   Text(
      //                     'Mobile No',
      //                     style: TextStyle(fontSize: AppHelper.titleFontSize),
      //                   ),
      //                   Text(
      //                     '918273465',
      //                     style: TextStyle(fontSize: AppHelper.titleFontSize),
      //                   )
      //                 ]),
      //                 TableRow(children: [
      //                   Text(
      //                     'Gender',
      //                     style: TextStyle(fontSize: AppHelper.titleFontSize),
      //                   ),
      //                   Text(
      //                     'Male',
      //                     style: TextStyle(fontSize: AppHelper.titleFontSize),
      //                   )
      //                 ]),
      //                 TableRow(children: [
      //                   Text(
      //                     'Birth Date',
      //                     style: TextStyle(fontSize: AppHelper.titleFontSize),
      //                   ),
      //                   Text(
      //                     '27-07-2026',
      //                     style: TextStyle(fontSize: AppHelper.titleFontSize),
      //                   )
      //                 ])
      //               ],
      //             ),
      //           ),
      //         ),
      //         SizedBox(
      //           height: 20,
      //         ),
      //         ElevatedButton(
      //           onPressed: () {},
      //           child: Text('Delete Account'),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
