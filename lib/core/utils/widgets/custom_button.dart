import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/theme/app_color.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';
import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({
    super.key, required this.title,this.onTap,
    
  });
  final VoidCallback? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height*0.08,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaryColor
        ),
        onPressed: onTap, child: Center(child: Text(title,style:CustomStyleText.whiteColorBold,),)),
    );
  }
}
