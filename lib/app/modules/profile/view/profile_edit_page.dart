import 'package:flutter/material.dart';
import 'package:moorse_india_user/core/app_color.dart';
import 'package:moorse_india_user/core/app_helper.dart';

class ProfileEditPage extends StatelessWidget {
  ProfileEditPage({super.key});
  ValueNotifier<String> groupValue = ValueNotifier('male');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppHelper.buttonRadius),
              color: Colors.pink),
          child: Center(
            child: Text(
              'Save Changes',
              style: TextStyle(
                  color: AppColor.whiteColor,
                  fontSize: AppHelper.titleFontSize),
            ),
          ),
        ),
      )),
      backgroundColor: AppColor.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('Edit Profile'),
        actions: [],
        centerTitle: true,
        backgroundColor: AppColor.whiteColor,
        surfaceTintColor: AppColor.whiteColor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/man 1.png'),
              radius: 40.0,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Edit Image',
                  style: TextStyle(color: Colors.blue),
                )),
            Container(
              width: double.infinity,
              // height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppHelper.buttonRadius),
                  color: AppColor.whiteColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name'),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(gapPadding: 0.0),
                        suffixIcon: Icon(Icons.edit)),
                  ),
                  Text('Email ID'),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(gapPadding: 0.0),
                        suffixIcon: Icon(Icons.edit)),
                  ),
                  Text('Mobile'),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(gapPadding: 0.0),
                        suffixIcon: Icon(Icons.edit)),
                  ),
                  Text('Gender'),
                  Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all()),
                    child: ValueListenableBuilder(
                        valueListenable: groupValue,
                        builder: (context, gp, _) {
                          return Row(
                            children: [
                              Radio(
                                  activeColor: Colors.black,
                                  value: 'male',
                                  groupValue: gp,
                                  onChanged: (value) {
                                    groupValue.value = value!;
                                  }),
                              Text('male'),
                              Radio(
                                  activeColor: Colors.black,
                                  value: 'female',
                                  groupValue: gp,
                                  onChanged: (value) {
                                    groupValue.value = value!;
                                  }),
                              Text('female'),
                            ],
                          );
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
