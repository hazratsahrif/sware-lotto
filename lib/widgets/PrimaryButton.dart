import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:wallet/constant/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.title,
    required this.onTab
  }) : super(key: key);
  final Callback onTab;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(

          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 9)),
            backgroundColor: MaterialStateProperty.all(MyColor.yellow),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          ),
          onPressed: onTab, child: Text(title,
        style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),
      )),
    );
  }
}