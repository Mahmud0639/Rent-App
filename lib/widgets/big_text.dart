import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  TextOverflow overflow;
   BigText({super.key,required this.text,this.color = Colors.black,this.size = 16,this.overflow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontSize: size,
        color: color
      ),
    );
  }
}
