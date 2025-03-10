import 'package:elmanfy/core/theme/app_color.dart';
import 'package:flutter/material.dart';

typedef MyValidator = String? Function(String?)?;

class CustomTextFeild extends StatelessWidget {
  CustomTextFeild(
      {super.key,
      required this.hintText,
      this.prefix,
      this.text,
      this.sufix,
      this.borderColor = AppColor.primaryColor,
      this.maxLines = 1,
      this.onChanged,
      this.controller,
      this.security = false,
      this.validator});

  MyValidator? validator;
  String hintText;
  String? text;
  Widget? prefix;
  Widget? sufix;
  TextEditingController? controller;
  
  Color? borderColor;
  int maxLines;
  bool security;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: AppColor.primaryColor,),
      obscureText: security,
      initialValue: text,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:const TextStyle(color:AppColor.primaryColor,fontSize: 20),
        prefixIcon: prefix,
        suffixIcon: sufix,
        disabledBorder: makeAllBorder(color: Colors.grey, radius: 16),
        enabledBorder: makeAllBorder(color: borderColor!, radius: 16),
        focusedBorder:
            makeAllBorder(color: AppColor.primaryColor, radius: 16),
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