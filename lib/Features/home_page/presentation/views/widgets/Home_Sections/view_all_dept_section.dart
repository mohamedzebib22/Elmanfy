import 'package:elmanfy/Features/home_page/presentation/views/screens/paid_debts.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';
import 'package:flutter/material.dart';

class ViewAllDeptSection extends StatelessWidget {
  const ViewAllDeptSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    String id = args['id'];
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, PaidDebtsPage.id, arguments:{
          'id' : id,
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child:const Row(
          children: [
            Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            Text(
              Constant.viewAllDebt,
              style: CustomStyleText.whiteColorBold,
            ),
          ],
        ),
      ),
    );
  }
}