import 'package:elmanfy/Features/home_page/presentation/views/widgets/custom_icon_button.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class PartSpecifications extends StatelessWidget {
  const PartSpecifications({
    super.key,
    
  });

  

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Card(
      color: Color(0xffD6D6D6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical:height*0.02 ,horizontal: width*0.02),
            child: Column(children: [
              CustomIconButton(title: Constant.discount, iconName: Icon(Icons.sell_sharp,color: Colors.white,), buttonColor: Colors.orange,),
              SizedBox(height: height*0.001,),
              CustomIconButton(title: Constant.payment, iconName: Icon(Icons.payment_sharp,color: Colors.white,),buttonColor: Colors.green,),
              SizedBox(height: height*0.001,),
              CustomIconButton(title: Constant.delete, iconName: Icon(Icons.delete_sharp,color: Colors.white,),buttonColor: Colors.red,),
            ],),
          ),
          Padding(
             padding: EdgeInsets.symmetric(vertical:height*0.02 ,horizontal: width*0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
              CustomText(title: '${Constant.nameOfThePiece}:كيبورد',textStyle:CustomStyleText.bold16Black ,),
              CustomText(title: '${Constant.priceOfThePiece}:100',textStyle:CustomStyleText.bold16Black ,),
              CustomText(title: '${Constant.count}:5',textStyle:CustomStyleText.bold16Black ,),
              CustomText(title: '${Constant.historyOfReligion}:1/1/2025',textStyle:CustomStyleText.bold16Black ,),
              CustomText(title: '${Constant.totalPrice}:500',textStyle:CustomStyleText.bold18Primary ,),
            ],),
          ),
        ],
      ),);
  }
}
