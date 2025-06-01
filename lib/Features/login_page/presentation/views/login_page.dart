
import 'package:elmanfy/features/login_page/presentation/views/widgets/login_page_body.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static String id = 'LoginPage';

  @override
  Widget build(BuildContext context) {
   
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: LoginPageBody(),
        ),
      ),
    );
  }
}

