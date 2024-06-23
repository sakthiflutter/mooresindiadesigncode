import 'package:flutter/material.dart';
import 'package:moorse_india_user/core/app_color.dart';
import 'package:moorse_india_user/core/app_helper.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});
  final ItemScrollController itemScrollController = ItemScrollController();
  ValueNotifier<int> currentIndex =ValueNotifier(0) ;

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
            onPressed: () {},
            icon: Image.asset(
              'assets/images/Vector-1.png',
              scale: 6,
            ))
      ],
    );
    return Scaffold(
      appBar: appBar2,
      body: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 1 / 4,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: ValueListenableBuilder(
              valueListenable: currentIndex,
              builder: (context,cIndex,_) {
                return ListView.builder(
                    itemCount: 16,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          
                              currentIndex.value = index;
                          itemScrollController.scrollTo(
                              index: index,
                              duration: Duration(seconds: 2),
                              curve: Curves.easeInOutCubic);
                        },
                        child: Container(
                          decoration: BoxDecoration(color:cIndex==index?Colors.white: Colors.grey.shade300 ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: AssetImage(
                                    'assets/remove/Her1.jpg',
                                  ),
                                ),
                                Text('category ${index+1}')
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 3 / 4,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: ScrollablePositionedList.builder(
              itemScrollController: itemScrollController,
              itemCount: 16,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text('Category ${index + 1}'),
                        Container(
                          height: (((MediaQuery.of(context).size.width * 3 / 4) /
                                  3)) *
                              (12 / 3).ceil(),
                          child: GridView.builder(
                              itemCount: 11,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 3,
                                      crossAxisSpacing: 3,
                                      childAspectRatio: 1),
                              itemBuilder: (context, index) {
                                return Container(
                                  // width: 70,
                                  // height: 60,
                                  decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/remove/Him 2.jpg'))),
                                              child: Stack(
                                                children: [
                                                Align(
                                                  alignment: Alignment.bottomCenter,
                                                  child: Container(
                                                   decoration: BoxDecoration(  borderRadius: BorderRadius.circular(5),  color: Colors.black,),
                                                  
                                                    width: double.infinity,
                                                    height: 20,
                                                    child: Center(child: Text('SubCategcddfdfory',style: TextStyle(color:Colors.white,fontSize: 9),maxLines: 1,overflow: TextOverflow.fade,)),
                                                  ),
                                                )
                                                ],
                                              ),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
