import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class ProfileTextField extends StatelessWidget {
  const ProfileTextField({
    Key? key,
    required this.title,
    required this.suffixIcon,
    required this.controller,
    required this.textInputType,
    this.hintFontWeight,
    this.textFontWeight,
    this.onIconTab,
  }) : super(key: key);

  final TextEditingController controller;
  final String title;
  final IconData? suffixIcon;
  final FontWeight? hintFontWeight;
  final FontWeight? textFontWeight;
  final TextInputType textInputType;
  final Callback? onIconTab;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextFormField(
        keyboardType: textInputType,
        controller: controller,
        cursorColor: Colors.grey,
        style: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: textFontWeight),
        decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide(width: 6, color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 1.5, color: Colors.grey)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 1.5, color: Colors.grey)),
            suffixIcon: IconButton(
              icon: Icon(
                suffixIcon,
                color: Colors.grey,
              ),
              onPressed: onIconTab,
            ),
            hintText: title,
            hintStyle: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: hintFontWeight,
            )),
      ),
    );
  }
}
