import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet/constant/colors.dart';
class MyTextFieldBlue extends StatefulWidget {
  String hint;
  TextEditingController controller;
  ValueChanged<String> valueChanged;
  IconData? icons;
  bool isObsecure;
  Color focusColor;
  Color enableBorder;
  int inPutNumber;
  MyTextFieldBlue({required this.hint,required this.controller,required this.valueChanged,required this.icons,required this.isObsecure, required this.focusColor,
    required this.enableBorder,
    required this.inPutNumber
  });
  @override
  State<MyTextFieldBlue> createState() => _MyTextFieldBlueState();
}

class _MyTextFieldBlueState extends State<MyTextFieldBlue> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.widget.controller=widget.controller;
  }
 // @override
 //  void dispose() {
 //    // TODO: implement dispose
 //    super.dispose();
 //    widget.controller.dispose();
 //  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 4),
      child: TextField(
        onChanged:  widget.valueChanged,
        controller: widget.controller,
        cursorColor: Colors.white,
        textAlignVertical: TextAlignVertical.center,
        cursorWidth: 2.4,
         inputFormatters: [
             FilteringTextInputFormatter.digitsOnly,
           LengthLimitingTextInputFormatter(widget.inPutNumber),

         ],
        keyboardType: TextInputType.number,
        style: TextStyle(
            color: Colors.black,
            fontSize: 14,
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
          hintText: widget.hint,
          hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 14,
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: widget.focusColor, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: widget.enableBorder, width: 1),
          ),

        ),
      ),
    );
  }
}
