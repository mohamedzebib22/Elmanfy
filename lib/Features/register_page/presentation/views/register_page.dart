import 'package:elmanfy/features/register_page/presentation/views/widgets/register_page_body.dart';

import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  static String id = 'RegisterPage';
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: RegisterPageBody(),
        ),
      ),
    );
  }
}
