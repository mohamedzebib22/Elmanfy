import 'package:elmanfy/features/forget_password_page/presentation/views/forget_password_page.dart';
import 'package:elmanfy/features/home_page/presentation/views/screens/home_page.dart';
import 'package:elmanfy/features/login_page/presentation/views/widgets/login_page_body.dart';
import 'package:elmanfy/features/register_page/presentation/views/register_page.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/theme/app_color.dart';
import 'package:elmanfy/core/theme/custom_style_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_button.dart';
import 'package:elmanfy/core/utils/widgets/custom_text.dart';
import 'package:elmanfy/core/utils/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static String id = 'LoginPage';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: LoginPageBody(),
        ),
      ),
    );
  }
}

