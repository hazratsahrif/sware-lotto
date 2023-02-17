import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/constant/colors.dart';
class MyTextField extends StatefulWidget {
  String hint;
  TextEditingController controller;
  ValueChanged<String> valueChanged;
  IconData? icons;
  bool isObsecure;
  TextInputType? textInputType;

  MyTextField({required this.hint,required this.controller,required this.valueChanged,required this.icons,required this.isObsecure, this.textInputType});
  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.widget.controller=widget.controller;
    this.widget.isObsecure = widget.isObsecure;
  }
  bool isClicked=false;
 // @override
 //  void dispose() {
 //    // TODO: implement dispose
 //    super.dispose();
 //    widget.controller.dispose();
 //  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
      child: TextField(
        onChanged:  widget.valueChanged,
        controller: widget.controller,
        cursorColor: Colors.white,
        textAlignVertical: TextAlignVertical.center,
        cursorWidth: 2.4,
        keyboardType: widget.textInputType==null ? TextInputType.text:widget.textInputType,
        obscureText: widget.isObsecure,
        style:  TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w400

        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 18,vertical: 8),
          hintText: widget.hint,
          suffixIcon: IconButton(icon: Icon( widget.icons,color: MyColor.yellow,size: 30),onPressed: (){
            widget.isObsecure= !widget.isObsecure;
            setState(() {
              widget.icons = widget.isObsecure? Icons.key_off : Icons.key;

            });
          },) ,
          hintStyle: TextStyle(
              color: Colors.white70,
              fontSize: 18,

              fontWeight: FontWeight.w400

          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: MyColor.yellow, width: 2.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: MyColor.yellow, width: 2.5),
          ),

        ),
      ),
    );
  }
}
