import 'package:get/get.dart';
import 'package:rent_app/pages/home/controller.dart';

class HomeBindings implements Bindings{


  @override
  void dependencies() {
    Get.lazyPut<HomeController>(()=>HomeController());
  }


}