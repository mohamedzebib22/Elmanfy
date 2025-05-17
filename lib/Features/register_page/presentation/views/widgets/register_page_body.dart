import 'package:elmanfy/features/register_page/presentation/views/widgets/sections/input_register_data_sections.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/utils/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class RegisterPageBody extends StatelessWidget {
  const RegisterPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          const Center(
            child: CustomText(title: Constant.createAccount),
          ),
          SizedBox(
            height: height * 0.08,
          ),
          InputRegisterDataSection(),
        ],
      ),
    );
  }
}
