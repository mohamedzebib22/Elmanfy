import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DetailsCardUser extends StatelessWidget {
  const DetailsCardUser({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Card(
        color: Color(0xffD6D6D6),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomText(
                title: '${Constant.customerName}:محمد سمير',
                textStyle: CustomStyleText.bold16Black,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomText(
                title: '${Constant.phoneNumber}:01064328893',
                textStyle: CustomStyleText.bold16Black,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomText(
                title: '${Constant.dateOfAdded}:13/3/2025',
                textStyle: CustomStyleText.bold16Black,
              ),
            ],
          ),
        ));
  }
}
