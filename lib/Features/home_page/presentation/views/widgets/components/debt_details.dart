import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_button.dart';
import 'package:elmanfy/core/utils/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DebtDetails extends StatelessWidget {
  const DebtDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        CustomText(
          title: 'كيبورد',
          textStyle: CustomStyleText.bold18Primary,
        ),
        CustomText(
          title: 'المبلغ:${100}',
          textStyle: CustomStyleText.bold18Primary,
        ),
        CustomText(
          title: 'الكمية:${5}',
          textStyle: CustomStyleText.bold18Primary,
        ),
        CustomBotton(
          title: Constant.payTheAmount,
        ),
      ],
    );
  }
}
