import 'package:elmanfy/Features/login_page/presentation/views/login_page.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/theme/app_color.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_button.dart';
import 'package:elmanfy/core/utils/widgets/custom_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';

class InputRegisterDataSection extends StatelessWidget {
  const InputRegisterDataSection({
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
          SizedBox(
            height: height / 8,
          ),
          CustomTextFeild(
            hintText: Constant.fullName,
            sufix: const Icon(
              Icons.person_2_sharp,
              color: AppColor.primaryColor,
            ),
          ),
          SizedBox(
            height: height * 0.02,
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
            height: height * 0.02,
          ),
          CustomTextFeild(
            hintText: Constant.submitPassword,
            sufix: const Icon(
              Icons.visibility_off_sharp,
              color: AppColor.primaryColor,
            ),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          CustomBotton(title: Constant.createAccount,onTap: (){},),
          SizedBox(
            height: height * 0.02,
          ),
          InkWell(
            onTap: (){
              Navigator.pushReplacementNamed(context, LoginPage.id);
            },
            child: const CustomText(
              title: Constant.doYouHaveAccount,
              textStyle: CustomStyleText.primaryColorBold,
            ),
          ),
          
        ],
      ),
    );
  }
}