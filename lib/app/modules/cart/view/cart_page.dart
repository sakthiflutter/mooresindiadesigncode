import 'package:flutter/material.dart';
import 'package:moorse_india_user/core/app_color.dart';
import 'package:moorse_india_user/core/app_helper.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key, this.isfromNavBar = false});
  bool isfromNavBar;
  int itemCount = 4;
  List sizeList = ['S', 'M', 'L', 'XL', 'XXL', 'XXXL'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          surfaceTintColor: AppColor.whiteColor,
          title: Text('Cart'),
        ),
        body:
         Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                itemCount: itemCount+1,
                itemBuilder: (context, index) {
                  if (index < itemCount) {
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppHelper.buttonRadius),
                          color: AppColor.appbarBackColor),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 100,
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      AppHelper.buttonRadius),
                                  color: AppColor.appbarBackColor,
                                  image: DecorationImage(
                                      image: AssetImage(
                                    'assets/remove/proDetImage.png',
                                  ))),
                            ),
                          ),
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Stylish Exclusive',
                                    style: TextStyle(
                                        fontSize: AppHelper.titleFontSize),
                                  ),
                                  SizedBox(width:(MediaQuery.of(context).size.width/360)* 50,),
                                  Icon(Icons.delete,color: Colors.red,)
                                ],
                              ),
                              Text(
                                'Womens Printed dress with stones',
                                style: TextStyle(
                                    fontSize: AppHelper.normalFontSize),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 80,
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(
                                            AppHelper.buttonRadius)),
                                    child: DropdownButtonFormField(
                                        decoration: const InputDecoration(
                                            border: InputBorder.none),
                                        items: sizeList.map((e) {
                                          return DropdownMenuItem(
                                            child: Text(e.toString()),
                                            value: e,
                                          );
                                        }).toList(),
                                        onChanged: (value) {}),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 80,
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(
                                            AppHelper.buttonRadius)),
                                    child: DropdownButtonFormField(
                                        decoration: const InputDecoration(
                                            border: InputBorder.none),
                                        items: sizeList.map((e) {
                                          return DropdownMenuItem(
                                            child: Text(e.toString()),
                                            value: e,
                                          );
                                        }).toList(),
                                        onChanged: (value) {}),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: 60,
                    );
                  }
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 5,
                ),
              ),
            ),
            Positioned(
              left: 10,
              bottom: isfromNavBar ? 60 : 5,
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(AppHelper.buttonRadius),
                    border: Border.all()),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '₹ 4000',
                        style: TextStyle(
                            color: AppColor.whiteColor,
                            fontSize: AppHelper.normalFontSize),
                      ),
                      Text(
                        'View details',
                        style: TextStyle(
                            color: AppColor.whiteColor,
                            fontSize: AppHelper.smallFontSize),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 10,
              bottom: isfromNavBar ? 60 : 5,
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(AppHelper.buttonRadius),
                    border: Border.all()),
                child: Center(
                  child: Text(
                    'Process to payment',
                    style: TextStyle(color: AppColor.whiteColor),
                  ),
                ),
              ),
            )
          ],
        )
        );
  }
}
