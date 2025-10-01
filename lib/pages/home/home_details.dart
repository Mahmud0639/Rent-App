import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_app/widgets/big_text.dart';
import 'package:rent_app/widgets/icon_widget.dart';
import 'package:rent_app/widgets/small_text.dart';

class HomeDetails extends StatelessWidget {
   HomeDetails({super.key});

  final myDataList = Get.arguments;


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
                       Positioned(top: 10,left: 10,child: IconWidget(icon: Icons.arrow_back_ios)),
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
                  height: 20,
                ),
              //description
              BigText(text: "Description",size: 20,)
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
