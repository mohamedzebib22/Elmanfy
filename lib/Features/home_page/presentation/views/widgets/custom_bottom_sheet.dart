import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/utils/widgets/custom_button.dart';
import 'package:elmanfy/core/utils/widgets/custom_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});
  
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin:EdgeInsets.symmetric(horizontal: width*0.04), 
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/elmanfy.jpg'),fit: BoxFit.fill)),
      child: Column(children: [
        SizedBox(height: height*0.02,),
        CustomText(title: Constant.addNewCustomer),
         SizedBox(height: height*0.04,),
        CustomTextFeild(hintColor: Colors.white,hintText: Constant.customerName,labelText: Constant.customerName,textStyleColor: Colors.white,foucusBorder:Colors.white,borderColor:Colors.white ,),
        SizedBox(height: height*0.02,),
        CustomTextFeild(hintColor: Colors.white,hintText: Constant.phoneNumber,labelText: Constant.phoneNumber,textStyleColor: Colors.white,foucusBorder:Colors.white,borderColor:Colors.white ),
        SizedBox(height: height*0.02,),
        CustomTextFeild(hintColor: Colors.white,hintText: Constant.dateOfAdded,labelText: Constant.dateOfAdded,textStyleColor: Colors.white,foucusBorder:Colors.white,borderColor:Colors.white ,sufix: IconButton(onPressed: (){}, icon: Icon(Icons.event,color: Colors.white,)),),
        SizedBox(height: height*0.04,),
        CustomBotton(title: Constant.addNewCustomer),
        SizedBox(height: height*0.04,),
      ],),
    );
  }
}