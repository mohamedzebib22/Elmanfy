import 'package:elmanfy/Features/login_page/presentation/views/login_page.dart';
import 'package:elmanfy/Features/register_page/data/cubit/register_cubit.dart';
import 'package:elmanfy/Features/register_page/data/cubit/register_state.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/di/di.dart';
import 'package:elmanfy/core/theme/app_color.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_button.dart';
import 'package:elmanfy/core/utils/widgets/custom_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_text_feild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputRegisterDataSection extends StatelessWidget {
  InputRegisterDataSection({super.key});
  

 
  @override
  Widget build(BuildContext context) {
    RegisterCubit viewModel = getIt<RegisterCubit>();

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Form(
      key:RegisterCubit.get(context).formkey ,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.04, vertical: height * 0.02),
        height: height * .9,
        decoration: const BoxDecoration(
            color: AppColor.containerColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(36), topRight: Radius.circular(36))),
        child: BlocBuilder<RegisterCubit, RegisterState>(
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(
                  height: height / 8,
                ),
                CustomTextFeild(
                  controller: RegisterCubit.get(context).userName,
                  validator: (name) {
                    if (name == null || name.isEmpty) {
                      return 'برجاء ادخال الاسم';
                    } else {
                      return null;
                    }
                  },
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
                  controller: RegisterCubit.get(context).userEmail,
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return 'برجاء ادخال الايميل';
                    } else {
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
                  height: height * 0.02,
                ),
                CustomTextFeild(
                  controller: RegisterCubit.get(context).userPassword,
                  validator: (password) {
                    if (password == null || password.isEmpty) {
                      return 'برجاء ادخال كلمة السـر';
                    } else {
                      return null;
                    }
                  },
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
                  controller: RegisterCubit.get(context).userRePaswword,
                  validator: (rePassword) {
                    if (rePassword == null || rePassword.isEmpty) {
                      return 'برجاء ادخال تاكيد كلمة السـر';
                    } else if (rePassword != RegisterCubit.get(context).userRePaswword.text) {
                      return 'كلمة السر غير متطابقة';
                    } else {
                      return null;
                    }
                  },
                  hintText: Constant.submitPassword,
                  sufix: const Icon(
                    Icons.visibility_off_sharp,
                    color: AppColor.primaryColor,
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
               state is RegisterLoading ? Center(child: CircularProgressIndicator(),) :
                CustomBotton(
                  title: Constant.createAccount,
                  onTap: () {
                    if (RegisterCubit.get(context).formkey.currentState!.validate()) {
                      RegisterCubit.get(context).register(
                          email: RegisterCubit.get(context).userEmail.text,
                          password: RegisterCubit.get(context).userPassword.text, 
                          context: context);
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, LoginPage.id);
                  },
                  child: const CustomText(
                    title: Constant.doYouHaveAccount,
                    textStyle: CustomStyleText.primaryColorBold,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
