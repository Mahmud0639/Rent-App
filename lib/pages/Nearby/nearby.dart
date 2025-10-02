import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/icon_widget.dart';
import '../home/bindings.dart';
import '../home/view.dart';

class Nearby extends StatelessWidget {
  const Nearby({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Nearby Page",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            GestureDetector(onTap: (){
              Get.to(()=>HomeView(),binding: HomeBindings());
            },child: IconWidget(icon: Icons.arrow_back_ios))
          ],
        ),
      ),
    );;
  }
}
