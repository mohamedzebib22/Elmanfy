import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DetailsCardUser extends StatelessWidget {
  const DetailsCardUser({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as  Map<String ,dynamic>;
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
                title: '${Constant.customerName}:${args['full_name']}',
                textStyle: CustomStyleText.bold16Black,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomText(
                title: '${Constant.phoneNumber}:${args['phone']}',
                textStyle: CustomStyleText.bold16Black,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomText(
                title: '${Constant.dateOfAdded}:${args['dateOfAdded']}',
                textStyle: CustomStyleText.bold16Black,
              ),
            ],
          ),
        ));
  }
}
