import 'package:get/get.dart';
import 'package:rent_app/pages/home/index.dart';
import 'package:rent_app/routes/app_routes.dart';

class AppPage{
  static final INITIAL = AppRoutes.INITAIL;
  
  static List<GetPage> routes = [
    GetPage(name: AppRoutes.INITAIL, page:()=> HomeView(),binding: HomeBindings())
  ];
}