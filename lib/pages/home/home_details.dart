import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_app/pages/home/view.dart';
import 'package:rent_app/widgets/big_text.dart';
import 'package:rent_app/widgets/expandable_text.dart';
import 'package:rent_app/widgets/icon_widget.dart';
import 'package:rent_app/widgets/small_text.dart';

class HomeDetails extends StatelessWidget {
   HomeDetails({super.key});

  final myDataList = Get.arguments;

   List<String> items = ['assets/images/garden_house.jpg', 'assets/images/house_2.jpg', 'assets/images/house_4.jpg', 'assets/images/house_5.jpg','assets/images/house_6.jpg','assets/images/house_7.jpg','assets/images/house_8.jpg'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.only(left: 15,right: 15,top: 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Container(
                width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height*0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey
                ),
                 
                 child: ClipRRect(
                   borderRadius: BorderRadius.circular(15),
                   child: Stack(
                     fit: StackFit.expand,
                     children: [
                       Image.network("${myDataList['image']}",fit: BoxFit.cover,),
                       Positioned(top: 10,left: 10,child: GestureDetector(
                           onTap: (){
                             Get.back();
                             //we can also like this way
                             //Get.offAll(()=>HomeView());
                           }
                           ,child: IconWidget(icon: Icons.arrow_back_ios))),
                       Positioned(top: 10,right: 10,child: IconWidget(icon: Icons.bookmark_border_rounded)),
                       Positioned(bottom: 80,left: 10,child: BigText(text: "${myDataList['title']}",size: 20,color: Colors.white,)),
                       Positioned(
                         bottom: 60,
                         left: 10,
                         child: SmallText(
                           text: "${myDataList['subtitle']}${myDataList['subtitle']}",
                            color: Colors.white54,
                         ),
                       ),

                       Positioned(bottom: 10,left: 10,child: IconWidget(icon: Icons.bed_outlined,size: 12,widthHeight: 40,)),
                       Positioned(bottom: 18,left: 60,child: SmallText(text: "6 Bedroom",color: Colors.white54,)),

                       Positioned(bottom: 10,left: 160,child: IconWidget(icon: Icons.bathroom_outlined,size: 12,widthHeight: 40,)),
                       Positioned(bottom: 18,left: 210,child: SmallText(text: "4 Bathroom",color: Colors.white54,)),
                     ],
                   )
                 ),
              ),
                SizedBox(
                  height: 15,
                ),
              //description
              BigText(text: "Description",size: 20,),




              //Expandable text widget
              ExpandableText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
              SizedBox(height: 15,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/my_pic.jpeg"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        SizedBox(width: 15),
                        // Name + Role
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(text: "Mahmud Islam", size: 15),
                            SmallText(text: "Owner"),
                          ],
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blue[300],
                          ),
                          child: Icon(Icons.call,color: Colors.white,),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blue[300],
                          ),
                          child: Icon(CupertinoIcons.chat_bubble_fill,color: Colors.white,),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20,),



              //Gallery
              BigText(text: "Gallery",size: 20,),
              SizedBox(height: 10,),

              //generate images
              Wrap(
                spacing: 16,
                runSpacing: 8,
                direction: Axis.horizontal,
                children: List.generate(
                  items.length > 4 ? 4 : items.length,
                      (index) {
                    if (items.length > 4 && index == 3) {
                      int remaining = items.length - 3;
                      return Container(
                        width: 70,
                        height: 70,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(fit: BoxFit.cover,image: AssetImage(items[index]))
                        ),
                        child: Center(
                          child: Text(
                            '+$remaining',
                            style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        width: 70,
                        height: 70,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(fit: BoxFit.cover,image: AssetImage(items[index]))
                        ),
                      );
                    }
                  },
                ),


              ),

              SizedBox(height: 30,),

              Container(
                width: double.infinity,
                height: 200,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(fit: BoxFit.cover,"assets/images/my_location.jpeg"),
                ),
              )


            ],

          ),
        ),
            ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height*0.13,
        color: Colors.grey[200],
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(text: "Price"),
                  BigText(text: "Rp. 2,500,000,000 / Year",size: 18,),
                ],

              ),

             //ripple effect button we used here..
             Material(
                 color: Colors.blue[300],
               borderRadius: BorderRadius.circular(15),
               child: InkWell(
                 onTap: (){},
                 splashColor: Colors.white.withOpacity(0.3),
                 highlightColor: Colors.transparent,
                 child: Container(
                   width: 120,
                   height: 50,
                   //margin: EdgeInsets.only(bottom: 27),
                   alignment: Alignment.center,
                   padding: EdgeInsets.all(10),
                   child: BigText(text: "Rent Now",color:Colors.white,),
                 ),
               ),

             ).marginOnly(bottom: 27)

            ],
          ),
        ),
      ),

    );
  }
}
