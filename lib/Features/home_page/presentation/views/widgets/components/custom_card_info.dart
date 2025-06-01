import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomCardInfo extends StatelessWidget {
  const CustomCardInfo({super.key, required this.name, required this.phone, required this.dateOfAdded, required this.onTap});
  final String name;
  final String phone;
  final String dateOfAdded;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Card(
      color:const Color(0xffD6D6D6),
      child: Row(children: [
        Row(children: [
          IconButton(onPressed: onTap, icon: const Icon(Icons.delete_forever_sharp,color: Colors.red,)),
          

        ],),
        SizedBox(width: width*0.08,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
          CustomText(title: '${Constant.customerName}:$name',textStyle:CustomStyleText.bold16Black ,),
          SizedBox(height: height*0.02,),
          CustomText(title: '${Constant.phoneNumber}:$phone',textStyle:CustomStyleText.bold16Black ,),
          SizedBox(height: height*0.02,),
          CustomText(title: '${Constant.dateOfAdded}:$dateOfAdded',textStyle:CustomStyleText.bold16Black ,),
        ],)
      ],),
    );
  }
}