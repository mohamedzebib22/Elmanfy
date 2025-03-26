import 'package:elmanfy/Features/home_page/presentation/views/screens/home_page.dart';
import 'package:elmanfy/Features/login_page/data/cubit/login_cubit.dart';
import 'package:elmanfy/Features/login_page/data/cubit/login_state.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/theme/app_color.dart';
import 'package:elmanfy/core/utils/widgets/custom_button.dart';
import 'package:elmanfy/core/utils/widgets/custom_text_feild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputDataSection extends StatelessWidget {
  const InputDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is LoginSucsess){
           ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Login Sucsess')));
        }else if(state is LoginFailure){
           ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.faliures.errMessage)));
        }
      },
      builder: (context, state) {
        return Form(
          key: LoginCubit.get(context).formkey,
          child: Column(
            children: [
              SizedBox(
                height: height / 6,
              ),
              CustomTextFeild(
               
                validator: (email) {
                  if (email == null || email.isEmpty) {
                    return 'برجاء ادخال الايميل';
                  }else{
                    return null;
                  }
                },
                
                controller: LoginCubit.get(context).email,
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
              
                validator: (password) {
                  if (password == null || password.isEmpty) {
                    return 'برجاء ادخال كلمة السر';
                  }else{
                    return null;
                  }
                },
                controller: LoginCubit.get(context).password,
                hintText: Constant.password,
                sufix: const Icon(
                  Icons.visibility_off_sharp,
                  color: AppColor.primaryColor,
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
            state is LoginLoading ? Center(child: CircularProgressIndicator(),):  CustomBotton(
                title: Constant.login,
                onTap: () {
                
                  LoginCubit.get(context).loginUser(context: context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
