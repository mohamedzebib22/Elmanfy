import 'package:elmanfy/Features/login_page/presentation/views/widgets/sections/body_of_input_data_section.dart';

import 'package:elmanfy/core/constants/constant.dart';

import 'package:elmanfy/core/utils/widgets/custom_text.dart';

import 'package:flutter/material.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({
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
            child: CustomText(title: Constant.login),
          ),
          SizedBox(
            height: height * 0.08,
          ),
          const BodyOfInputDataSection(),
        ],
      ),
    );
  }
}
