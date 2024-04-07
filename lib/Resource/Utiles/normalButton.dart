
import 'package:denomination/Resource/Colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class normalButton extends StatelessWidget {
  normalButton({Key? key,
    required this.name,
    this.bckColor=appcolors.primaryColor,
    this.textColor=appcolors.whiteColor,
    this.height=50,
    this.width=double.infinity,
    this.fontSize=14,
    this.bordeRadious=5,
  }) : super(key: key);

  String name;
  Color bckColor;
  Color textColor;
  double width;
  double height;
  double fontSize;
  double bordeRadious;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: bckColor,
        borderRadius: BorderRadius.circular(bordeRadious),
      ),
      child: Center(child: Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize, color: textColor)))
    );
  }
}
