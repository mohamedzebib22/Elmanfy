import 'package:elmanfy/Features/forget_password_page/presentation/views/forget_password_page.dart';
import 'package:elmanfy/Features/home_page/presentation/views/screens/customer_details_page.dart';
import 'package:elmanfy/Features/home_page/presentation/views/screens/home_page.dart';
import 'package:elmanfy/Features/home_page/presentation/views/screens/paid_debts.dart';
import 'package:elmanfy/Features/login_page/presentation/views/login_page.dart';
import 'package:elmanfy/Features/register_page/presentation/views/register_page.dart';
import 'package:elmanfy/core/theme/app_theme.dart';
import 'package:elmanfy/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
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
        HomePage.id : (context) => HomePage(),
        CustomerdetailsPage.id : (context) => CustomerdetailsPage(),
        PaidDebtsPage.id : (context) => PaidDebtsPage(),
      },
      initialRoute: LoginPage.id,
    );
  }
}
