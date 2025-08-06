import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/font_theme.dart';

class CustomTextField extends StatefulWidget {
  Color? borderColor;
  bool? obscure;
  TextEditingController? controller;
  String? hintText;
  Color? cursorColor;
  String? labelText;
  TextStyle? hintStyle;
  TextStyle? labelStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  void Function()? onTap;
  String? Function(String?)? validator;
  int? maxLines;
  Color? fillColor;
  CustomTextField({this.obscure,this.onTap,
    this.cursorColor,this.fillColor,
      this.controller,this.validator,this.maxLines,
    this.prefixIcon,this.hintStyle,this.suffixIcon,
    this.borderColor, this.hintText,this.labelText,this.labelStyle,

  });
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextStyle? Style;


  Widget build(BuildContext context) {
    return
      TextFormField

        (onEditingComplete:widget.onTap ,
         obscureText:widget.obscure??false ,
          validator:widget.validator  ,
          controller: widget.controller,
          maxLines: widget.maxLines??1,
          cursorColor: widget.cursorColor ?? AppColors.BlackColor,
          style:Style ?? FontTheme.semi20White,
          decoration: InputDecoration(
            filled: true,
            fillColor: widget.fillColor,
            labelStyle: widget.labelStyle,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            hintStyle:widget.hintStyle ?? FontTheme.semi16white,
            hintText: widget.hintText ?? '',
            labelText:widget.labelText,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide:
                BorderSide(color: widget.borderColor ?? AppColors.Transpernt, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide:
                BorderSide(color: widget.borderColor ?? Colors.blueGrey, width: 2)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: widget.borderColor ?? Colors.red, width: 2)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: widget.borderColor ?? Colors.red, width: 2)),
          ));

  }
}
