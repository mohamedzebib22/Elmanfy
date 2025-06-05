import 'package:bloc/bloc.dart';
import 'package:elmanfy/features/home_page/presentation/views/screens/home_page.dart';
import 'package:elmanfy/features/login_page/data/Repositories/login_repo.dart';
import 'package:elmanfy/features/login_page/data/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());

  final LoginRepo loginRepo;
  TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool obscurePassword = true;
  static LoginCubit get(context) => BlocProvider.of(context);


  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    emit(LoginInitial());
  }


  loginUser({required BuildContext context})async{
  
    if(formkey.currentState!.validate()){
        emit(LoginLoading());
      var either = await loginRepo.loginUser(email: email.text.trim(), password: password.text);
    return either.fold((error){
      emit(LoginFailure(faliures: error));
    }, (response){
      emit(LoginSucsess());
      //Navigator.pushReplacementNamed(context, HomePage.id);
    });
    }
    
  }
}
