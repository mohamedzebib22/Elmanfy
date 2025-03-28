import 'package:elmanfy/Features/home_page/presentation/views/widgets/components/custom_icon_button.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key, required this.nameOfThePiece, required this.priceOfThePiece, required this.count, required this.historyOfReligion, required this.totalPrice,
    
  });

  final String nameOfThePiece;
  final int priceOfThePiece;
  final int count;
  final String historyOfReligion;
  final int totalPrice;

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
              CustomText(title: '${Constant.nameOfThePiece}:$nameOfThePiece',textStyle:CustomStyleText.bold16Black ,),
              CustomText(title: '${Constant.priceOfThePiece}:$priceOfThePiece',textStyle:CustomStyleText.bold16Black ,),
              CustomText(title: '${Constant.count}:$count',textStyle:CustomStyleText.bold16Black ,),
              CustomText(title: '${Constant.historyOfReligion}:$historyOfReligion',textStyle:CustomStyleText.bold16Black ,),
              CustomText(title: '${Constant.totalPrice}:$totalPrice',textStyle:CustomStyleText.bold18Primary ,),
            ],),
          ),
        ],
      ),);
  }
}
