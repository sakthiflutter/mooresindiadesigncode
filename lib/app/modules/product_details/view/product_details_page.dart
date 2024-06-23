import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moorse_india_user/core/app_color.dart';
import 'package:moorse_india_user/core/app_helper.dart';
import 'package:read_more_text/read_more_text.dart';

class ProductDetailsPage extends StatelessWidget {
  ProductDetailsPage({super.key});
  final _current_slider = ValueNotifier(0);
  List carouselImageList = [
    'assets/remove/proDetImage.png',
    'assets/remove/proDetImage.png',
    'assets/remove/proDetImage.png',
    'assets/remove/proDetImage.png'
  ];
  List sizeList = ['S', 'M', 'L', 'XL', 'XXL', 'XXL'];
  ValueNotifier<int> currentIndex = ValueNotifier(0);

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
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              CarouselSlider.builder(
                  itemCount: carouselImageList.length,
                  itemBuilder: (context, index, realIndex) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          AppHelper.buttonRadius,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Image.asset(carouselImageList[index]),
                          Positioned(
                              top: 10,
                              right: 20,
                              child: Column(
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey.shade400),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                        'assets/images/Vector-1.png',
                                        scale: 6,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey.shade400),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                        'assets/images/Vector.png',
                                        scale: 6,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey.shade400),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                        'assets/images/sharing 1.png',
                                        scale: .9,
                                      ),
                                    ),
                                  )
                                ],
                              ))
                        ],
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 500,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: false,
                    autoPlayInterval: Duration(seconds: 15),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                    disableCenter: true,
                    onPageChanged: (index, reason) {
                      _current_slider.value = index;
                    },
                  )),
              ValueListenableBuilder(
                  valueListenable: _current_slider,
                  builder: (context, curr_slide, _) {
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            carouselImageList.length,
                            (index) => Container(
                                  width: 18.0,
                                  height: 4.5,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 4.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: curr_slide == index
                                        ? AppColor.activeColor
                                        : AppColor.deActiveColor,
                                  ),
                                )));
                  }),
              const SizedBox(height: 10),
              Text(
                'Big Saving Zone',
                style: TextStyle(fontSize: AppHelper.titleFontSize),
              ),
              Text(
                '₹4000',
                style: TextStyle(
                    decoration: TextDecoration.lineThrough, color: Colors.red),
              ),
              Text(
                '₹2000 (Inclusive all the tax)',
                style: TextStyle(color: Colors.green),
              ),
              Text(
                '50% OFF',
                style: TextStyle(color: Colors.green),
              ),
              const SizedBox(height: 10),
              Text(
                'Color',
                style: TextStyle(fontSize: AppHelper.titleFontSize),
              ),
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius:
                              BorderRadius.circular(AppHelper.buttonRadius),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage('assets/remove/proDetImage.png'))),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 5,
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Select Size',
                style: TextStyle(fontSize: AppHelper.titleFontSize),
              ),
              ValueListenableBuilder(
                  valueListenable: currentIndex,
                  builder: (context, curIdx, _) {
                    return Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: sizeList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              currentIndex.value = index;
                            },
                            child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: index == curIdx
                                      ? Colors.black
                                      : Colors.white,
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(
                                      AppHelper.buttonRadius),
                                ),
                                child: Center(
                                    child: Text(
                                  sizeList[index],
                                  style: TextStyle(
                                      color: index != curIdx
                                          ? Colors.black
                                          : Colors.white),
                                ))),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 5,
                          );
                        },
                      ),
                    );
                  }),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppHelper.buttonRadius),
                    color: Colors.black),
                child: Center(
                    child: Text(
                  'Add to Cart',
                  style: TextStyle(
                      fontSize: AppHelper.titleFontSize, color: Colors.white),
                )),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Product Details',
                style: TextStyle(fontSize: AppHelper.titleFontSize),
              ),
              SizedBox(
                height: 10,
              ),
              ReadMoreText(
                'This is a very long text to demo the usages of this package\n'
                'This is a very long text to demo the usages of this package\n'
                'This is a very long text to demo the usages of this package\n'
                'This is a very long text to demo the usages of this package\n'
                'This is a very long text to demo the usages of this package\n'
                'This is a very long text to demo the usages of this package\n'
                'This is a very long text to demo the usages of this package\n'
                'This is a very long text to demo the usages of this package',
                numLines: 2,
                readMoreText: 'Read more',
                readLessText: 'Read less',
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset('assets/images/Layer_1.png'),
                  Image.asset('assets/images/Layer_1-1.png'),
                  Image.asset('assets/images/Layer_1-2.png')
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rating',
                    style: TextStyle(fontSize: AppHelper.titleFontSize),
                  ),
                  Text(
                    'Veiw More',
                    style: TextStyle(
                        fontSize: AppHelper.normalFontSize, color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Icon(Icons.star),
                      Text(
                        'Rating',
                        style: TextStyle(fontSize: AppHelper.smallFontSize),
                      ),
                    ],
                  ),
                  VerticalDivider(
                    color: Colors.amber,
                    thickness: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        'Customer words',
                        style: TextStyle(fontSize: AppHelper.normalFontSize),
                      ),
                      Text(
                        'size and fit ; good',
                        style: TextStyle(fontSize: AppHelper.smallFontSize),
                      ),
                      Text(
                        'product quality ; good',
                        style: TextStyle(fontSize: AppHelper.smallFontSize),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10,),
              SimillarRowWidget(),
              SimillarProductGridWidget(catImgList: catImgList)
            ],
          ),
        ),
      ),
    );
  }
}
class SimillarProductGridWidget extends StatelessWidget {
  const SimillarProductGridWidget({
    super.key,
    required this.catImgList,
  });

  final List<String> catImgList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
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
        });
  }
}
class SimillarRowWidget extends StatelessWidget {
  const SimillarRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 3.6,
          height: 2,
          color: Colors.grey,
        ),
        const Text(
          'Simillar Products',
          style: TextStyle(fontSize: 18),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 3.6,
          height: 2,
          color: Colors.grey,
        ),
      ],
    );
  }
}
