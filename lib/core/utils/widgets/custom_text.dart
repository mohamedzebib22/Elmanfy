import 'package:auto_size_text/auto_size_text.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.title,this.textStyle = CustomStyleText.whiteColorBold});
  final String title;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
   title,
   textDirection: TextDirection.rtl,
  style:textStyle,
  minFontSize: 18,
  maxLines: 4,
  overflow: TextOverflow.ellipsis,
);
  }
}