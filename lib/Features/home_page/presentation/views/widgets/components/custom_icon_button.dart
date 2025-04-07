import 'package:elmanfy/Features/home_page/presentation/views/screens/paid_debts.dart';
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
          padding: EdgeInsets.symmetric(horizontal: width*0.02),
          child: Row(
          children: [
            IconButton(onPressed: (){
             
            }, icon: iconName),
            Text(title,style:const TextStyle(color: Colors.white),)
          ],
              ),
        ),),
    );
  }
}