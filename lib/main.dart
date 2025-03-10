import 'package:elmanfy/Features/forget_password_page/presentation/views/forget_password_page.dart';
import 'package:elmanfy/Features/login_page/presentation/views/login_page.dart';
import 'package:elmanfy/Features/register_page/presentation/views/register_page.dart';
import 'package:elmanfy/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Elmanfy());
}
class Elmanfy extends StatelessWidget {
  const Elmanfy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      theme: AppTheme.ligtTheme,
      routes: {
        LoginPage.id : (context) => LoginPage(),
        RegisterPage.id : (context) => RegisterPage(),
        ForgetPasswordPage.id : (context) => ForgetPasswordPage(),
      },
      initialRoute: ForgetPasswordPage.id,
    );
  }
}
