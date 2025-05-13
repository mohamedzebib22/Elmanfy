import 'package:elmanfy/core/theme/app_color.dart';
import 'package:flutter/material.dart';

typedef MyValidator = String? Function(String?)?;

class CustomTextFeild extends StatelessWidget {
  CustomTextFeild(
      {super.key,
      required this.hintText,
      this.prefix,
      this.text,
      this.labelText,
      this.sufix,
      this.borderColor = AppColor.primaryColor,
      this.textStyleColor = AppColor.primaryColor,
      this.hintColor = AppColor.primaryColor,
      this.foucusBorder,
      this.maxLines = 1,
      this.onChanged,
      this.controller,
      this.isFill = false,
      this.security = false,
      this.keyboardType,
      this.fillColor = Colors.transparent,
      this.validator});

  MyValidator? validator;
  String hintText;
  String? text;
  Widget? prefix;
  Widget? sufix;
  TextEditingController? controller;
  String? labelText;
  Color? borderColor;
  Color? hintColor;
  int maxLines;
  bool security;
  bool? isFill;
  Color? fillColor;
  Color? textStyleColor;
  Color? foucusBorder;
  TextInputType? keyboardType;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      style: TextStyle(color: textStyleColor,),
      obscureText: security,
      initialValue: text,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white,fontSize: 16),
        filled:isFill ,
        fillColor:fillColor ,
        hintText: hintText,
        hintStyle: TextStyle(color:hintColor,fontSize: 14),
        prefixIcon: prefix,
        suffixIcon: sufix,
        disabledBorder: makeAllBorder(color: Colors.grey, radius: 16),
        enabledBorder: makeAllBorder(color: borderColor!, radius: 16),
        focusedBorder:
            makeAllBorder(color: foucusBorder ??AppColor.primaryColor , radius: 16),
        focusedErrorBorder:
            makeAllBorder(color: Colors.red, radius: 16),
        errorBorder: makeAllBorder(color: Colors.red, radius: 16),
      ),
      
    );
  }

  OutlineInputBorder makeAllBorder(
      {required Color color, required double radius}) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: color),
        borderRadius: BorderRadius.circular(radius));
  }
}