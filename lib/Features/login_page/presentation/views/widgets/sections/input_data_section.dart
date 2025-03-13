import 'package:elmanfy/Features/home_page/presentation/views/screens/home_page.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/theme/app_color.dart';
import 'package:elmanfy/core/utils/widgets/custom_button.dart';
import 'package:elmanfy/core/utils/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';

class InputDataSection extends StatelessWidget {
  const InputDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: height / 6,
        ),
        CustomTextFeild(
          hintText: Constant.email,
          sufix: const Icon(
            Icons.email_sharp,
            color: AppColor.primaryColor,
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        CustomTextFeild(
          hintText: Constant.password,
          sufix: const Icon(
            Icons.visibility_off_sharp,
            color: AppColor.primaryColor,
          ),
        ),
        SizedBox(
          height: height * 0.04,
        ),
        CustomBotton(
          title: Constant.login,
          onTap: () {
            Navigator.pushReplacementNamed(context, HomePage.id);
          },
        ),
      ],
    );
  }
}
