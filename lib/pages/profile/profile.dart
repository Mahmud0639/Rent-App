import 'package:flutter/material.dart';
import 'package:rent_app/pages/home/bindings.dart';
import 'package:rent_app/pages/home/view.dart';
import 'package:rent_app/widgets/icon_widget.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Profile Page",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              GestureDetector(onTap: (){
                Get.to(()=>HomeView(),binding: HomeBindings());
              },child: IconWidget(icon: Icons.arrow_back_ios))
            ],
          ),
      ),
    );
  }
}
