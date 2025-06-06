import 'package:elmanfy/features/login_page/presentation/views/login_page.dart';
import 'package:elmanfy/features/register_page/data/cubit/register_cubit.dart';
import 'package:elmanfy/features/register_page/data/cubit/register_state.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/di/di.dart';
import 'package:elmanfy/core/theme/app_color.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_button.dart';
import 'package:elmanfy/core/utils/widgets/custom_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputRegisterDataSection extends StatelessWidget {
  const InputRegisterDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Form(
      key: RegisterCubit.get(context).formkey,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.04, vertical: height * 0.02),
        height: height * .9,
        decoration: const BoxDecoration(
            color: AppColor.containerColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(36), topRight: Radius.circular(36))),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSucsess) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Register Sucsess, Please verify Your Email')));
              Navigator.pushReplacementNamed(context, LoginPage.id);
            } else if (state is RegisterFailuer) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.faliures.errMessage)));
            }
          },
          builder: (context, state) {
            if (state is RegisterFailuer) {}
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
                  keyboardType: TextInputType.emailAddress,
                  controller: RegisterCubit.get(context).userEmail,
                  validator: (email) {
                    if (email == null || email.trim().isEmpty) {
                      return 'برجاء ادخال الايميل';
                    } else if (!RegisterCubit.get(context)
                        .isValidEmail(email.trim())) {
                      return 'البريد الإلكتروني غير صالح';
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
                  security: RegisterCubit.get(context).obscurePassword1,
                  controller: RegisterCubit.get(context).userPassword,
                  validator: (password) {
                    if (password == null || password.isEmpty) {
                      return 'برجاء ادخال كلمة السـر';
                    } else {
                      return null;
                    }
                  },
                  hintText: Constant.password,
                  sufix: InkWell(
                    onTap: () {
                      RegisterCubit.get(context).togglePasswordVisibility1();
                    },
                    child: Icon(
                      RegisterCubit.get(context).obscurePassword1
                          ? Icons.visibility_off_sharp
                          : Icons.visibility,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextFeild(
                  security: RegisterCubit.get(context).obscurePassword2,
                  controller: RegisterCubit.get(context).userRePaswword,
                  validator: (rePassword) {
                    if (rePassword == null || rePassword.isEmpty) {
                      return 'برجاء ادخال تاكيد كلمة السـر';
                    } else if (rePassword !=
                        RegisterCubit.get(context).userPassword.text) {
                      return 'كلمة السر غير متطابقة';
                    } else {
                      return null;
                    }
                  },
                  hintText: Constant.submitPassword,
                  sufix: InkWell(
                    onTap: () {
                      RegisterCubit.get(context).togglePasswordVisibility2();
                    },
                    child: Icon(
                      RegisterCubit.get(context).obscurePassword2
                          ? Icons.visibility_off_sharp
                          : Icons.visibility,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                state is RegisterLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomBotton(
                        title: Constant.createAccount,
                        onTap: () async {
                          if (RegisterCubit.get(context)
                              .formkey
                              .currentState!
                              .validate()) {
                            final registerCubit = RegisterCubit.get(context);
                            final result = await registerCubit.register();
                            
                            if (result == true) {
                              await registerCubit.addAdminToFirestore();
                            }
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
