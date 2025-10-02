import 'package:get/get.dart';

class Dimensions{
  static double screenHeight = Get.height;
  //height = 800 and  we divide what we want to take
  //like we want to take 200 height container
  //then 800/200 = 4 now this 4 will be divided by our Get.height/4

  static double sizedBoxHeight_10 = screenHeight/64;
  static double sizedBoxHeight_20 = screenHeight/32;
  static double sizedBoxHeight_30 = screenHeight/21.33;

  static double padding_15 = screenHeight/42.67;

  static double font_16 = screenHeight/40;
  static double font_20 = screenHeight/32;
  static double font_24 = screenHeight/26.67;

  static double searchBar_width = screenHeight/2.96;



  static double radius_20 = screenHeight/32;
  static double radius_30 = screenHeight/21.33;


  static double width_30 = screenHeight/21.33;
  static double width_10 = screenHeight/64;
  static double width_20 = screenHeight/32;

  static double height_45 = screenHeight/14.22;
  static double height_50 = screenHeight/16;


  static double iconSize_16 = screenHeight/40;
  static double iconSize_24 = screenHeight/26.67;

}