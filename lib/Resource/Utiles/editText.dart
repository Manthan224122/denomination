

import 'package:denomination/Resource/Colors/app_colors.dart';
import 'package:flutter/material.dart';


class editTextSimple extends StatelessWidget {
  editTextSimple({Key? key,
    required this.controllers,
    required this.focusNode,
    required this.keyboardTypes,
    required this.hint,
    required this.maxlength,
    this.counterTexts='',
    this.label='',
    this.controllerSize=14,
    this.cHeight=50,
    this.cWidth=double.infinity,
  }) : super(key: key);

  TextEditingController controllers;
  FocusNode focusNode = FocusNode();
  var keyboardTypes;
  String label;
  String hint;
  String counterTexts;
  int maxlength;
  double controllerSize;
  double cHeight;
  double cWidth;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: cHeight,
      width: cWidth,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0), // Adjust the radius as needed
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        maxLength: maxlength,
        keyboardType:keyboardTypes,
        controller: controllers,
        focusNode: focusNode,
        decoration: InputDecoration(
            filled: true,
            fillColor: appcolors.primaryColor,
            contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 15),
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: Color(0xffC5C5C5), // Border color
                width: 0.5,         // Border width
              ),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
             counterText: counterTexts,
             labelText: label,
            hintText: hint,
            hintStyle: TextStyle(fontSize: 12,decoration: TextDecoration.none,color: Colors.white),
            labelStyle: TextStyle(decoration: TextDecoration.none)
        ),
        style: TextStyle(fontSize: controllerSize,color: Colors.white),

      ),
    );
  }
}




