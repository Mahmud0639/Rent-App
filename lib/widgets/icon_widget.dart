import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {

  final IconData icon;
  final Color color;
  final double size;
  final double widthHeight;


  const IconWidget({super.key,required this.icon, this.color = Colors.black26,this.size = 25,this.widthHeight = 40});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      alignment: Alignment.center,
      width: widthHeight,
      height: widthHeight,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(size)
      ),
      child: Icon(icon,color: Colors.white,size: 20,),
    );
  }
}
