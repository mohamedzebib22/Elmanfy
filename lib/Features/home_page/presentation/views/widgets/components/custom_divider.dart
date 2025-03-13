import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    
  });

  

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height:height*0.0001 ,
      decoration: BoxDecoration(
        color: Color(0xffD6D6D6),
        border: Border.all(color: Color(0xffD6D6D6),width: 2)
      ),
    );
  }
}