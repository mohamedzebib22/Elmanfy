import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/utils/widgets/custom_button.dart';
import 'package:elmanfy/core/utils/widgets/custom_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';

class BottomSheetOfAdddebt extends StatelessWidget {
  const BottomSheetOfAdddebt({super.key});
  
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
     
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/elmanfy.jpg'),fit: BoxFit.fill)),
      child: Column(children: [
        SizedBox(height: height*0.02,),
        CustomText(title: Constant.addNewCustomer),
         SizedBox(height: height*0.04,),
        CustomTextFeild(hintColor: Colors.white,hintText: Constant.nameOfThePiece,labelText: Constant.nameOfThePiece,textStyleColor: Colors.white,foucusBorder:Colors.white,borderColor:Colors.white ,),
        SizedBox(height: height*0.02,),
        CustomTextFeild(hintColor: Colors.white,hintText: Constant.count,labelText: Constant.count,textStyleColor: Colors.white,foucusBorder:Colors.white,borderColor:Colors.white ,),
        SizedBox(height: height*0.02,),
        CustomTextFeild(hintColor: Colors.white,hintText: Constant.priceOfThePiece,labelText: Constant.priceOfThePiece,textStyleColor: Colors.white,foucusBorder:Colors.white,borderColor:Colors.white ),
        SizedBox(height: height*0.02,),
        CustomTextFeild(hintColor: Colors.white,hintText: Constant.historyOfReligion,labelText: Constant.historyOfReligion,textStyleColor: Colors.white,foucusBorder:Colors.white,borderColor:Colors.white ,sufix: IconButton(onPressed: (){}, icon: Icon(Icons.event,color: Colors.white,)),),
        SizedBox(height: height*0.04,),
        CustomBotton(title: Constant.addNewCustomer),
        SizedBox(height: height*0.04,),
      ],),
    );
  }
}