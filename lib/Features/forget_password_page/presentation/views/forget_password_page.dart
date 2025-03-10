import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/theme/app_color.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_button.dart';
import 'package:elmanfy/core/utils/widgets/custom_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});
  static String id = 'ForgetPassword';
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: height * 0.05,
                ),
                const Center(
                  child: CustomText(title: Constant.forgetPasswordPage),
                ),
                SizedBox(
                  height: height * 0.08,
                ),
                Container(
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
                      SizedBox(
                        height: height / 8,
                      ),
                      CustomTextFeild(
                        hintText: Constant.email,
                        sufix: const Icon(
                          Icons.email_sharp,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      CustomBotton(title: Constant.sendLink,),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      const CustomText(
                        title: Constant.backToLoginPage,
                        textStyle: CustomStyleText.bold18Primary,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
