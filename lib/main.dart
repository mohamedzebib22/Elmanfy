import 'package:elmanfy/Features/forget_password_page/data/cubit/foreget_password_cubit.dart';
import 'package:elmanfy/Features/forget_password_page/presentation/views/forget_password_page.dart';
import 'package:elmanfy/Features/home_page/data/cubits/add_user_cubit/add_user_cubit.dart';
import 'package:elmanfy/Features/home_page/data/cubits/get_and_delete_user_cubit/get_and_delete_user_cubit.dart';
import 'package:elmanfy/Features/home_page/presentation/views/screens/customer_details_page.dart';
import 'package:elmanfy/Features/home_page/presentation/views/screens/home_page.dart';
import 'package:elmanfy/Features/home_page/presentation/views/screens/paid_debts.dart';
import 'package:elmanfy/Features/login_page/data/cubit/login_cubit.dart';
import 'package:elmanfy/Features/login_page/presentation/views/login_page.dart';
import 'package:elmanfy/Features/register_page/data/cubit/register_cubit.dart';
import 'package:elmanfy/Features/register_page/presentation/views/register_page.dart';
import 'package:elmanfy/core/di/di.dart';
import 'package:elmanfy/core/theme/app_theme.dart';
import 'package:elmanfy/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(
    providers: [
       BlocProvider(create:(context)  => getIt<RegisterCubit>()),
       BlocProvider(create:(context)  => getIt<LoginCubit>()),
       BlocProvider(create:(context)  => getIt<ForegetPasswordCubit>()),
       BlocProvider(create:(context)  => getIt<AddUserCubit>()),
       BlocProvider(create:(context)  => getIt<GetUserCubit>()),
    ],
    child: const Elmanfy()));
}

class Elmanfy extends StatefulWidget {
  const Elmanfy({super.key});

  @override
  State<Elmanfy> createState() => _ElmanfyState();
}

class _ElmanfyState extends State<Elmanfy> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('==============User is currently signed out!============');
      } else {
        print('==============User is signed in!===========');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.ligtTheme,
      routes: {
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        ForgetPasswordPage.id: (context) => ForgetPasswordPage(),
        HomePage.id: (context) => HomePage(),
        CustomerdetailsPage.id: (context) => CustomerdetailsPage(),
        PaidDebtsPage.id: (context) => PaidDebtsPage(),
      },
      initialRoute: LoginPage.id,
    );
  }
}
