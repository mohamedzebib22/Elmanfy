import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, required this.title, required this.iconName,required this.buttonColor});
  final String title;
  final Widget iconName;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
     var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Card(
      color: buttonColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width*0.02),
        child: Row(
        children: [
          IconButton(onPressed: (){}, icon: iconName),
          Text(title,style:const TextStyle(color: Colors.white),)
        ],
            ),
      ),);
  }
}