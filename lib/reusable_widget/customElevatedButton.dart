import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app1/core/utils/app_colors.dart';

class CustomElevatedButton extends StatelessWidget{
  Color backgroundColor;
  Color? borderColor;
  String text;
 TextStyle textStyle;
  void Function()? onTab;
 CustomElevatedButton({this.borderColor,this.onTab,required this.textStyle,required this.backgroundColor,required this.text,});
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
        RoundedRectangleBorder(side: BorderSide(color: borderColor??AppColors.Transpernt),borderRadius: BorderRadius.circular(15)),
      ),
    ),
    onPressed: onTab,
    child: Center(child: Text(text, style: textStyle)),
  );

  }

}