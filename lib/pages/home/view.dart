import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_app/drawer/my_custom_drawer.dart';
import 'package:rent_app/pages/home/controller.dart';
import 'package:rent_app/pages/home/home_details.dart';
import 'package:rent_app/widgets/big_text.dart';
import 'package:rent_app/widgets/small_text.dart';
import 'package:badges/badges.dart' as badges;

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Location",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
          textAlign: TextAlign.left,
        ),
      ),
      drawer:MyCustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                //notification with a red dot here
                child: badges.Badge(
                  position: badges.BadgePosition.topEnd(top: 4, end: 4),
                  showBadge: true,
                  ignorePointer: false,
                  badgeStyle: badges.BadgeStyle(
                    badgeColor: Colors.red,
                    padding: EdgeInsets.all(4),
                    shape: badges.BadgeShape.circle,
                    elevation: 0,
                  ),
                  badgeContent: null,
                  child: Icon(
                   // Icons.notifications_none_outlined,
                    CupertinoIcons.bell,
                    color: Colors.black,
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    "Jakarta",
                    style: TextStyle(
                      fontFamily: "Lato",
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey),
                ],
              ),

              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    width: 270,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.grey[50]),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey[400]),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search address, or near you",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue[300],
                    ),
                    child: Icon(Icons.tune_rounded, color: Colors.white),
                  ),
                ],
              ),

              SizedBox(height: 15),

              //Tabs
              Container(
                height: 40,
                //color: Colors.black,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.tabs.length,
                  padding: EdgeInsets.only(right: 20),
                  itemBuilder: (context, index) {
                    return Obx(() {
                      bool isSelect = controller.selectedIndex.value == index;
                      return GestureDetector(
                        onTap: () {
                          controller.changeTab(index);
                          print('...Tabs....: $index');
                        },
                        child: Container(
                          width: 90,
                          margin: EdgeInsets.only(right: 10),
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: isSelect
                                ? Colors.blue[300]
                                : Colors.grey[200],
                          ),
                          child: Text(
                            controller.tabs[index],
                            style: TextStyle(
                              fontSize: 12,
                              color: isSelect ? Colors.white : Colors.grey,
                            ),
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),

              SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(text: "Near from you", size: 20),
                  SmallText(text: "See more"),
                ],
              ),

              SizedBox(height: 15),

              //page view

              Obx(() {
                final selectedTab = controller.tabs[controller.selectedIndex.value];
                final listData = controller.dummyData[selectedTab]!;

                return SizedBox(
                  height: 230,

                  // color: Colors.blue,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listData.length,
                    itemBuilder: (context, position) {
                      /*final tabName = controller.tabs[position];
                   final listData = controller.dummyData[tabName];*/
                      final item = listData[position];

                      return Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: (){
                            Get.to(()=>HomeDetails(),arguments: item);
                          },
                          child: Container(
                            width: 200,
                            margin: EdgeInsets.only(right: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey,
                            ),
                          
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.network(
                                    item['image']!,
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    bottom: 35,
                                    left: 30,
                                    child: Text(
                                      "${listData[position]['title']}",
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 13,
                                    left: 30,
                                    child: Text(
                                      "${listData[position]['subtitle']}",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 20,
                                    right: 20,
                                    child: Container(
                                      width: 80,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.black45,
                                      ),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Row(
                                          children: [
                                            SizedBox(width: 5),
                                            Icon(
                                              Icons.location_on_outlined,
                                              color: Colors.white70,
                                            ),
                                            Text(
                                              "1.8 km",
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.white70,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),

              SizedBox(height: 15),

              //best for you row
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigText(text: "Best for you", size: 20),
                    SmallText(text: "See more"),
                  ],
                ),
              ),

              SizedBox(height: 10,),


              //last bottom view
              Obx((){
                final selectedTab =
                controller.tabs[controller.selectedIndex.value];
                final listData = controller.dummyData[selectedTab]!;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: listData.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 72,
                          //  color: Colors.greenAccent,
                          child: Row(
                            children: [
                              Container(
                                width: 72,
                                height: 72,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.black45,
                                ),
                                child: ClipRRect(borderRadius: BorderRadius.circular(15),child: Image.network("${listData[index]['image']}",fit: BoxFit.cover,)),
                              ),
                              SizedBox(width: 15,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BigText(text: "Orchard ${listData[index]['title']}",size: 20,),
                                    SmallText(text: "Rp. 2,500,000,000/Year",size: 12,color: Colors.blue,),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.bed_sharp,color: Colors.grey[300],),
                                            SizedBox(width: 4,),
                                            SmallText(text: "6 Bedroom")
                                          ],
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                
                                        Row(
                                          children: [
                                            Icon(Icons.bathroom_outlined,color: Colors.grey[300],),
                                            SizedBox(width: 4,),
                                            SmallText(text: "4 Bathroom")
                                          ],
                                        )
                                      ],
                                    ),
                                
                                
                                  ],
                                ),
                              )
                            ],


                          ),
                        ),
                        SizedBox(
                          height: 15,
                        )
                      ],

                    );


                  },
                );
              })

            ],
          ),
        ),
      ),
    );
  }
}
