import 'package:elmanfy/features/forget_password_page/presentation/views/forget_password_page.dart';
import 'package:elmanfy/features/register_page/presentation/views/register_page.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ForgetPasswordAndCreateAccountSection extends StatelessWidget {
  const ForgetPasswordAndCreateAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, ForgetPasswordPage.id);
          },
          child: const CustomText(
            title: Constant.forgetpass,
            textStyle: CustomStyleText.primaryColorBold,
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context, RegisterPage.id);
          },
          child: const CustomText(
            title: Constant.noHaveAccount,
            textStyle: CustomStyleText.bold18Primary,
          ),
        )
      ],
    );
  }
}
