import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_button.dart';
import 'package:elmanfy/core/utils/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DebtDetails extends StatelessWidget {
  const DebtDetails({
    super.key,
    required this.nameOfType,
    required this.price,
    required this.count,
    required this.dateOfPaid,
  });
  final String nameOfType;
  final int price;
  final int count;
  final String dateOfPaid;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomText(
          title: 'اسم القطعه :$nameOfType',
          textStyle: CustomStyleText.bold18Primary,
        ),
        CustomText(
          title: 'المبلغ:$price',
          textStyle: CustomStyleText.bold18Primary,
        ),
        CustomText(
          title: 'الكمية:$count',
          textStyle: CustomStyleText.bold18Primary,
        ),
        Text(
          'تاريخ الدفع:\n$dateOfPaid',
          style: CustomStyleText.bold18Primary,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        ),
        // CustomText(
        //   title: 'تاريخ الدفع:$dateOfPaid',
        //   textStyle: CustomStyleText.bold18Primary,
        // ),
        CustomBotton(
          title: Constant.payTheAmount,
          onTap: () {},
        ),
      ],
    );
  }
}
