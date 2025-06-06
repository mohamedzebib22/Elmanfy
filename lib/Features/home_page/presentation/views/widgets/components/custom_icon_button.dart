import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, required this.title, required this.iconName,required this.buttonColor, required this.onTap});
  final String title;
  final Widget iconName;
  final Color buttonColor;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
     var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onTap,
      child: Card(
        
        color: buttonColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.008),
          child: Row(
          children: [
           iconName,
            Text(title,style:const TextStyle(color: Colors.white),)
          ],
              ),
        ),),
    );
  }
}