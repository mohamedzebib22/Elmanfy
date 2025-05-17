import 'package:elmanfy/features/home_page/presentation/views/widgets/components/debt_details.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_button.dart';
import 'package:elmanfy/core/utils/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class PaymentDone extends StatelessWidget {
  const PaymentDone({
    super.key, required this.totalPrice, required this.nameOfType, required this.price, required this.count, required this.dateOfPaid,
    
  });
  final int totalPrice;
  final String nameOfType;
  final int price;
  final int count;
  final String dateOfPaid;
  @override
  Widget build(BuildContext context) {
     var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Card(
     
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'المجموع :$totalPrice',
            style: CustomStyleText.bold18Primary,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.02, vertical: height * 0.02),
            child: DebtDetails(nameOfType: nameOfType, price: price, count: count, dateOfPaid: dateOfPaid,),
          ),
        ],
      ),
    );
  }
}

