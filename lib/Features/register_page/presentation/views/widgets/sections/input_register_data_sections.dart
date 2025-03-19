import 'package:elmanfy/Features/login_page/presentation/views/login_page.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/theme/app_color.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_button.dart';
import 'package:elmanfy/core/utils/widgets/custom_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_text_feild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class InputRegisterDataSection extends StatefulWidget {
  const InputRegisterDataSection({
    super.key,
  });

  @override
  State<InputRegisterDataSection> createState() => _InputRegisterDataSectionState();
}

class _InputRegisterDataSectionState extends State<InputRegisterDataSection> {
  TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController rePaswword = TextEditingController();

    GlobalKey<FormState> formkey = GlobalKey<FormState>();
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
              topLeft: Radius.circular(36), topRight: Radius.circular(36))),
      child: Form(
        key: formkey,
        child: Column(
          children: [
            SizedBox(
              height: height / 8,
            ),
            CustomTextFeild(
              controller: name,
              validator: (name) {
                if (name == null || name.isEmpty) {
                  return 'برجاء ادخال الاسم';
                }else{
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
              controller: email,
              validator: (email) {
                if (email == null || email.isEmpty) {
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
              height: height * 0.02,
            ),
            CustomTextFeild(
              controller: password,
              validator: (password) {
                if (password == null || password.isEmpty) {
                  return 'برجاء ادخال كلمة السـر';
                }else{
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
              controller: rePaswword,
              validator: (rePassword) {
                if (rePassword == null || rePassword.isEmpty) {
                  return 'برجاء ادخال تاكيد كلمة السـر';
                }else{
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
            CustomBotton(
              title: Constant.createAccount,
              onTap: (){
                if(formkey.currentState!.validate()){
                  registerUser(email: email.text, password: password.text);
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
        ),
      ),
    );
  }

  registerUser({required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('=============RegisterSucsess==========');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
