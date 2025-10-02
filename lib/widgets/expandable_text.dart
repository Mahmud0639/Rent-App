import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:rent_app/widgets/big_text.dart';
import 'package:rent_app/widgets/small_text.dart';

class ExpandableText extends StatefulWidget {
  final String text;

  const ExpandableText({super.key, required this.text});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  // late String firstHalf;
  // late String secondHalf;
  //
  // bool hiddenText = true;
  //
  // double textHeight = Get.height / 4;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //
  //   if (widget.text.length > textHeight) {
  //     firstHalf = widget.text.substring(0, textHeight.toInt());
  //     secondHalf = widget.text.substring(
  //       textHeight.toInt() + 1,
  //       widget.text.length,
  //     );
  //   } else {
  //     firstHalf = widget.text;
  //     secondHalf = "";
  //   }
  //
  //   super.initState();
  // }

  //using readmore package
  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      widget.text,
      trimLines: 2,
      trimMode: TrimMode.Line,
      trimCollapsedText: ' Show more',
      trimExpandedText: ' Show less',
      moreStyle: TextStyle(fontSize: 14, color: Colors.blue),
      lessStyle: TextStyle(fontSize: 14, color: Colors.blue),
      style: TextStyle(
        color: Colors.grey,
        fontSize: 14,
        height: 1.5
      ),
    );
  }
}
