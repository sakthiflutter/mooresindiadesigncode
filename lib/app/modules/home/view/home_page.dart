import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moorse_india_user/app/modules/cart/view/cart_page.dart';
import 'package:moorse_india_user/app/modules/product_details/view/product_details_page.dart';
import 'package:moorse_india_user/core/app_color.dart';
import 'package:moorse_india_user/core/app_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = ScrollController();
  List<String> catImgList = [
    'assets/remove/Her1.jpg',
    'assets/remove/Him 2.jpg',
    'assets/remove/home.png',
    'assets/remove/image.jpg',
    'assets/remove/kids.jpg',
    'assets/remove/USPAHanes.jpg',
  ];
  List<String> catNameList = [
    'women',
    'men',
    'home decor',
    'home appliances',
    'kids wear',
    'inner wears',
  ];
  int count = 0;

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        fetch();
      }
    });
    super.initState();
  }

  fetch() {
    setState(() {
      catImgList.addAll([
        'assets/remove/Her1.jpg',
        'assets/remove/Him 2.jpg',
        'assets/remove/home.png',
        'assets/remove/image.jpg',
        'assets/remove/kids.jpg',
        'assets/remove/USPAHanes.jpg',
      ]);
      catNameList.addAll([
        'women',
        'men',
        'home decor',
        'home appliances',
        'kids wear',
        'inner wears',
      ]);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var appBar2 = AppBar(
      backgroundColor: AppColor.appbarBackColor,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
      title: Image.asset(
        'assets/images/logo.png',
        scale: 10,
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined)),
        IconButton(
            onPressed: () {
              Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      CartPage(),
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
            icon: Image.asset(
              'assets/images/Vector-1.png',
              scale: 6,
            ))
      ],
    );
    return Scaffold(
      appBar: appBar2,
      body: SingleChildScrollView(
        controller: _controller,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              HomeCategoryWidget(
                  catImgList: catImgList, catNameList: catNameList),
              const SizedBox(
                height: 10,
              ),
              HomeCarasoulWidget(),
              const SizedBox(height: 10),
              HomeDailyDeals(catNameList: catNameList, catImgList: catImgList),
              const SizedBox(
                height: 10,
              ),
              HomeHotDeals(),
              HomeNewArrival(catImgList: catImgList),
              const SizedBox(
                height: 10,
              ),
              Image.asset('assets/remove/banner3.png'),
              const SizedBox(
                height: 10,
              ),
              HomeBigSavingZoneWidget(catImgList: catImgList),
              const SizedBox(
                height: 10,
              ),
              ProductForYouRowWidget(),
              ProductForYouGridWidget(catImgList: catImgList),
              const SizedBox(
                height: 150,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductForYouGridWidget extends StatelessWidget {
  const ProductForYouGridWidget({
    super.key,
    required this.catImgList,
  });

  final List<String> catImgList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics:const NeverScrollableScrollPhysics(),
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

class ProductForYouRowWidget extends StatelessWidget {
  const ProductForYouRowWidget({
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
          'Products For You',
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

class HomeBigSavingZoneWidget extends StatelessWidget {
  const HomeBigSavingZoneWidget({
    super.key,
    required this.catImgList,
  });

  final List<String> catImgList;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColor.appbarBackColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(4, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Text('Big Saving Zone',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          const SizedBox(
            height: 10,
          ),
          OfferBannerWidget(catImgList: catImgList),
        ],
      ),
    );
  }
}

class HomeNewArrival extends StatelessWidget {
  const HomeNewArrival({
    super.key,
    required this.catImgList,
  });

  final List<String> catImgList;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColor.appbarBackColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(4, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
         Padding(
            padding: EdgeInsets.all(4.0),
            child: Row(
              children: [
                Text('New Arrivals',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                Spacer(),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Wrap(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                child: Chip(
                  label: Text(
                    'Ladies',
                    style: TextStyle(color: AppColor.whiteColor),
                  ),
                  backgroundColor: Colors.red,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                child: Chip(label: Text('men')),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                child: Chip(label: Text('kids')),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                child: Chip(label: Text('sports')),
              ),
            ],
          ),
          Container(
            height: 270,
            child: ListView.builder(
                itemCount: catImgList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Container(
                          width: 130,
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
                                      style:
                                          TextStyle(color: AppColor.whiteColor),
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
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class HomeHotDeals extends StatelessWidget {
  const HomeHotDeals({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppHelper.buttonRadius),
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppHelper.buttonRadius),
                topRight: Radius.circular(AppHelper.buttonRadius),
              ),
              color: Colors.red,
            ),
            height: 50,
            child: const Center(
                child: Text(
              'Hot Deals',
              style: TextStyle(
                  fontSize: 20,
                  color: AppColor.whiteColor,
                  fontWeight: FontWeight.bold),
            )),
          ),
          Container(
            color: AppColor.sliderContainerBackColor,
            width: double.infinity,
            height: 50,
            child: const Center(
                child: Text(
              'End In 02 d 22 h 20m 43 s',
              style: TextStyle(
                  fontSize: 20,
                  color: AppColor.whiteColor,
                  fontWeight: FontWeight.bold),
            )),
          ),
          Container(
            width: double.infinity,
            child: CarouselSlider(
                items: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          AppHelper.buttonRadius,
                        ),
                        color: AppColor.appbarBackColor),
                    child: Image.asset('assets/remove/banner1.jpg'),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          AppHelper.buttonRadius,
                        ),
                        color: AppColor.appbarBackColor),
                    child: Image.asset('assets/remove/banner1.jpg'),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset:
                              const Offset(4, 4), // changes position of shadow
                        )
                      ],
                      borderRadius: BorderRadius.circular(
                        AppHelper.buttonRadius,
                      ),
                      color: AppColor.appbarBackColor,
                    ),
                    child: Image.asset('assets/remove/banner1.jpg'),
                  )
                ],
                options: CarouselOptions(
                  height: 230,
                  viewportFraction: 1.0,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                )),
          )
        ],
      ),
    );
  }
}

class HomeDailyDeals extends StatelessWidget {
  const HomeDailyDeals({
    super.key,
    required this.catNameList,
    required this.catImgList,
  });

  final List<String> catNameList;
  final List<String> catImgList;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppHelper.buttonRadius),
            color: AppColor.appbarBackColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 5,
                offset: const Offset(4, 4), // changes position of shadow
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Daily Deals',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              const Text('Hurry, Only Today Available',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: ((MediaQuery.of(context).size.width / 3) - 4) *
                    (6 / 3).ceil(),
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: catNameList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                            crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(catImgList[index])),
                            borderRadius:
                                BorderRadius.circular(AppHelper.buttonRadius),
                            color: AppColor.appbarBackColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 1,
                                offset: const Offset(
                                    1, 3), // changes position of shadow
                              ),
                            ]),
                        child: Stack(
                          children: [
                            // Image.asset(
                            //  catImgList[index],
                            //   scale: 1.3,
                            // ),
                            Align(
                              alignment: const Alignment(-1, 0.9),
                              child: Text(catNameList[index],
                                  style: const TextStyle(
                                      backgroundColor: Colors.white,
                                      fontSize: 9,
                                      color: Color.fromARGB(255, 48, 54, 63))),
                            ),
                            Align(
                              alignment: const Alignment(1, 1),
                              child: Stack(
                                children: [
                                  Align(
                                      alignment: const Alignment(1, 1),
                                      child: Image.asset(
                                          'assets/images/image 10.png')),
                                  const Align(
                                    alignment: Alignment(0.7, 0.5),
                                    child: Text('OFF 10%',
                                        style: TextStyle(
                                            fontSize: 9, color: Colors.white)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}

class HomeCarasoulWidget extends StatelessWidget {
  const HomeCarasoulWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  AppHelper.buttonRadius,
                ),
                color: AppColor.appbarBackColor),
            child: Image.asset('assets/remove/banner.png'),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  AppHelper.buttonRadius,
                ),
                color: AppColor.appbarBackColor),
            child: Image.asset('assets/remove/banner.png'),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: const Offset(4, 4), // changes position of shadow
                )
              ],
              borderRadius: BorderRadius.circular(
                AppHelper.buttonRadius,
              ),
              color: AppColor.appbarBackColor,
            ),
            child: Image.asset('assets/remove/banner.png'),
          )
        ],
        options: CarouselOptions(
          height: 200,
          aspectRatio: 16 / 9,
          viewportFraction: 1.0,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ));
  }
}

class HomeCategoryWidget extends StatelessWidget {
  const HomeCategoryWidget({
    super.key,
    required this.catImgList,
    required this.catNameList,
  });

  final List<String> catImgList;
  final List<String> catNameList;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColor.appbarBackColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(4, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Row(
              children: [
                Text('Categories',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                Spacer(),
                Text(
                  'See All',
                  style: TextStyle(),
                ),
                Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.black,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 120,
            child: ListView.builder(
                itemCount: catImgList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70.0),
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
                        ),
                      ),
                      Container(
                          width: 100,
                          child: Text(
                            catNameList[index],
                            overflow: TextOverflow.fade,
                            textAlign: TextAlign.center,
                          ))
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class OfferBannerWidget extends StatelessWidget {
  const OfferBannerWidget({
    super.key,
    required this.catImgList,
  });

  final List<String> catImgList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView.builder(
          itemCount: catImgList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Container(
                    width: 130,
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
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/remove/offban.png'))),
                    // child: Stack(
                    //   children: [
                    //     Align(
                    //       alignment: Alignment(0, 1),
                    //       child: Container(
                    //           width: double.infinity,
                    //           height: 30,
                    //           color:
                    //               Colors.black.withOpacity(0.5),
                    //           child: Center(
                    //               child: Text(
                    //             'Stylease Exclusive',
                    //             style: TextStyle(
                    //                 color: AppColor.whiteColor),
                    //           ))),
                    //     )
                    //   ],
                    // ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
