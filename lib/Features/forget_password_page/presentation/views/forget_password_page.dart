import 'package:elmanfy/Features/forget_password_page/data/cubit/foreget_password_cubit.dart';
import 'package:elmanfy/Features/forget_password_page/data/cubit/foreget_password_state.dart';
import 'package:elmanfy/Features/login_page/presentation/views/login_page.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/theme/app_color.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_button.dart';
import 'package:elmanfy/core/utils/widgets/custom_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});
  static String id = 'ForgetPassword';
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .01),
            child: Form(
              key: ForegetPasswordCubit.get(context).keyFormState,
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
                    child: BlocBuilder<ForegetPasswordCubit, ForegetPasswordState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            SizedBox(
                              height: height / 8,
                            ),
                            CustomTextFeild(
                              controller: ForegetPasswordCubit.get(context).email,
                              validator: (email){
                                if(email == null || email.trim().isEmpty){
                                  return 'برجاء ادخال الايميل';
                                }else{
                                  return null;
                                }
                              },
                              hintText: Constant.email,
                              sufix: const Icon(
                                Icons.email_sharp,
                                color: AppColor.primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.04,
                            ),
                          state is ForegetPasswordLoading ? Center(child: CircularProgressIndicator(),) :  CustomBotton(
                              title: Constant.sendLink,
                              onTap: () {
                                ForegetPasswordCubit.get(context).foregetPassword(context: context);
                              },
                            ),
                            SizedBox(
                              height: height * 0.04,
                            ),
                            InkWell(
                              onTap: () {
                                
                                Navigator.pushReplacementNamed(
                                    context, LoginPage.id);
                              },
                              child: const CustomText(
                                title: Constant.backToLoginPage,
                                textStyle: CustomStyleText.bold18Primary,
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
