import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_app/drawer/controller.dart';
import 'package:rent_app/pages/Nearby/nearby.dart';
import 'package:rent_app/pages/home/view.dart';
import 'package:rent_app/pages/profile/profile.dart';
import 'package:badges/badges.dart' as badges;

class MyCustomDrawer extends GetView<DrawerControllerX> {
  const MyCustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue[400],

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                buildHeader(context),
                buildMenuItems(context)
            ],
          ),
        ),
      ),
    );
  }

Widget buildHeader(BuildContext context){
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    );
}
  Widget buildMenuItems(BuildContext context){
    return Container(
        padding: EdgeInsets.only(right: 80,top: 50),
      child: Wrap(
        runSpacing: 7,
        children: [

          _drawerItem(context, Icons.home_filled, "Home", (){
              controller.selectedItem('Home');
              Navigator.pop(context);
              Get.off(()=>HomeView());
          }),
        _drawerItem(context, Icons.person_outline, "Profile", (){
                      controller.selectedItem('Profile');
                      Navigator.pop(context);
                      Get.off(()=>Profile());
                  }),

          _drawerItem(context, Icons.location_on_outlined, "Nearby", (){
            controller.selectedItem('Nearby');
            Navigator.pop(context);
            Get.off(()=>Nearby());
          }),
          Divider(color: Colors.white,),

          ListTile(
            leading: Icon(Icons.bookmark_border_rounded,color: Colors.white,),
            title: Text('Bookmark',style: TextStyle(color: Colors.white),),
            onTap: (){

            },

          ),

          ListTile(
            leading: badges.Badge(
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
                child: Icon(Icons.notifications_none_outlined,color: Colors.white,)),
            title: Text('Notification',style: TextStyle(color: Colors.white),),
            onTap: (){

            },

          ),
          ListTile(
            leading: badges.Badge(
                position: badges.BadgePosition.topEnd(top: 2, end: 2),
                showBadge: true,
                ignorePointer: false,
                badgeStyle: badges.BadgeStyle(
                  badgeColor: Colors.red,
                  padding: EdgeInsets.all(4),
                  shape: badges.BadgeShape.circle,
                  elevation: 0,
                ),
                badgeContent: null,
                child: Icon(CupertinoIcons.chat_bubble,color: Colors.white,)),
            title: Text('Message',style: TextStyle(color: Colors.white),),
            onTap: (){

            },

          ),
          Divider(color: Colors.white,),

          ListTile(
            leading: Icon(Icons.settings,color: Colors.white,),
            title: Text('Settings',style: TextStyle(color: Colors.white),),
            onTap: (){

            },

          ),

          ListTile(
            leading: Icon(Icons.help_outline,color: Colors.white,),
            title: Text('Help',style: TextStyle(color: Colors.white),),
            onTap: (){

            },

          ),
          ListTile(
            leading: Icon(CupertinoIcons.power,color: Colors.white,),
            title: Text('Logout',style: TextStyle(color: Colors.white),),
            onTap: (){

            },

          ),
        ],
      ),
    );
  }



  Widget _drawerItem(BuildContext context, IconData icon, String title, VoidCallback onTap){

    final isSelected = controller.selected.value == title;

    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30)),
        color: isSelected?Colors.white:Colors.transparent,
      ),
      child: ListTile(
        leading: Icon(icon, color: isSelected?Colors.blue:Colors.white,),
        title: Text(title,style: TextStyle(color: isSelected?Colors.blue:Colors.white,fontWeight: isSelected?FontWeight.bold:FontWeight.normal),),

        onTap: onTap,
      ),

    );
  }
}
