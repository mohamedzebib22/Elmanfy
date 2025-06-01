import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    
  });

  

  @override
  Widget build(BuildContext context) {
   
    var height = MediaQuery.of(context).size.height;
    return Container(
      height:height*0.0001 ,
      decoration: BoxDecoration(
        color:const Color(0xffD6D6D6),
        border: Border.all(color: const Color(0xffD6D6D6),width: 2)
      ),
    );
  }
}