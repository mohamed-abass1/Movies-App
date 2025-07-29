import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget{
  Color backgroundColor;
 String text;
 TextStyle textStyle;
  void Function()? onTab;
 CustomElevatedButton({this.onTab,required this.textStyle,required this.backgroundColor,required this.text,});
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
return
  ElevatedButton(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(backgroundColor),
      padding: WidgetStateProperty.all(
        EdgeInsets.symmetric(vertical: height * 0.015, horizontal: width * 0.02),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    ),
    onPressed: onTab,
    child: Center(child: Text(text, style: textStyle)),
  );

  }

}