import 'package:elmanfy/core/notification/local_notifications.dart';
import 'package:elmanfy/core/notification/work_manager_services.dart';
import 'package:elmanfy/features/forget_password_page/data/cubit/foreget_password_cubit.dart';
import 'package:elmanfy/features/forget_password_page/presentation/views/forget_password_page.dart';
import 'package:elmanfy/features/home_page/data/cubits/add_dept/add_dept_cubit.dart';
import 'package:elmanfy/features/home_page/data/cubits/add_user_cubit/add_user_cubit.dart';
import 'package:elmanfy/features/home_page/data/cubits/cubit/delete_dept_cubit.dart';
import 'package:elmanfy/features/home_page/data/cubits/get_and_delete_user_cubit/get_and_delete_user_cubit.dart';
import 'package:elmanfy/features/home_page/data/cubits/get_dept/get_dept_cubit.dart';
import 'package:elmanfy/features/home_page/presentation/views/screens/customer_details_page.dart';
import 'package:elmanfy/features/home_page/presentation/views/screens/home_page.dart';
import 'package:elmanfy/features/home_page/presentation/views/screens/paid_debts.dart';
import 'package:elmanfy/features/login_page/data/cubit/login_cubit.dart';
import 'package:elmanfy/features/login_page/presentation/views/login_page.dart';
import 'package:elmanfy/features/register_page/data/cubit/register_cubit.dart';
import 'package:elmanfy/features/register_page/presentation/views/register_page.dart';
import 'package:elmanfy/core/di/di.dart';
import 'package:elmanfy/core/theme/app_theme.dart';
import 'package:elmanfy/features/test_notification/test_local_notification.dart';
import 'package:elmanfy/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

late String initialRoute;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  configureDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   await  WorkManagerServices().init();
    LocalNotificationsServices.showBasicNotification();
  await Future.wait([
    //   WorkManagerServices.init(),
    LocalNotificationsServices.init(),
    LocalNotificationsServices.requestPermission(),
   
  ]);
 

  
  
  
  
  FirebaseAuth.instance.authStateChanges().listen((user){
    if(user == null){
      initialRoute = LoginPage.id;
    }else{
      initialRoute = HomePage.id;
    }
  });
  runApp(MultiBlocProvider(
    providers: [
       BlocProvider(create:(context)  => getIt<RegisterCubit>()),
       BlocProvider(create:(context)  => getIt<LoginCubit>()),
       BlocProvider(create:(context)  => getIt<ForegetPasswordCubit>()),
       BlocProvider(create:(context)  => getIt<AddUserCubit>()),
       BlocProvider(create:(context)  => getIt<AddDeptCubit>()),
       BlocProvider(create:(context)  => getIt<DeleteDeptCubit>()),
       BlocProvider(create:(context)  => getIt<GetDeptCubit >()),
    
      // BlocProvider(create:(context)  => getIt<AddDeptCubit>()),
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
      locale: Locale('ar'),
      routes: {
        LoginPage.id: (context) => const LoginPage(),
        RegisterPage.id: (context) =>const RegisterPage(),
        ForgetPasswordPage.id: (context) => const ForgetPasswordPage(),
        HomePage.id: (context) =>const HomePage(),
        CustomerdetailsPage.id: (context) =>const CustomerdetailsPage(),
        PaidDebtsPage.id: (context) => const PaidDebtsPage(),
        TestLocalNotification.id: (context) => const TestLocalNotification(),
        // SubmitDeleteItem.id: (context) => const SubmitDeleteItem(),
      },
      initialRoute: TestLocalNotification.id,
    );
  }
}
