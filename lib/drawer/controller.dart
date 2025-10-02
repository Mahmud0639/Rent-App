import 'package:get/get.dart';

class DrawerControllerX extends GetxController{

  var selected = "Home".obs;

  void selectedItem(String menuItem){
    selected.value = menuItem;
  }

}
