import 'package:elmanfy/features/login_page/presentation/views/widgets/sections/forget_password_and_create_account_section.dart';
import 'package:elmanfy/features/login_page/presentation/views/widgets/sections/input_data_section.dart';
import 'package:elmanfy/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class BodyOfInputDataSection extends StatelessWidget {
  const BodyOfInputDataSection({
    super.key,
    
  
  });

  

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: height * 0.02),
      height: height * .9,
      decoration: const BoxDecoration(
          color: AppColor.containerColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(36),
              topRight: Radius.circular(36))),
      child: Column(
        children: [
          const InputDataSection(),
          SizedBox(
            height: height * 0.04,
          ),
          const ForgetPasswordAndCreateAccountSection()
        ],
      ),
    );
  }
}
