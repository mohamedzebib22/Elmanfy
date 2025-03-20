import 'package:bloc/bloc.dart';
import 'package:elmanfy/Features/forget_password_page/data/Repositories/forget_passwod_repo.dart';
import 'package:elmanfy/Features/forget_password_page/data/cubit/foreget_password_state.dart';
import 'package:elmanfy/Features/login_page/presentation/views/login_page.dart';
import 'package:elmanfy/core/utils/widgets/show_dialog_msg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quickalert/quickalert.dart';

@injectable
class ForegetPasswordCubit extends Cubit<ForegetPasswordState> {
  ForegetPasswordCubit(this.forgetPasswodRepo) : super(ForegetPasswordInitial());
  final ForgetPasswodRepo forgetPasswodRepo;
  TextEditingController email = TextEditingController();
  var formkey = GlobalKey<FormState>();

  static ForegetPasswordCubit get(context) => BlocProvider.of(context);

  foregetPassword({required BuildContext context})async{
    emit(ForegetPasswordLoading());
    if(formkey.currentState!.validate()){
      var either =await forgetPasswodRepo.forgetPassword(email: email.text);
      return either.fold((error){
       emit(ForegetPasswordFaliure(faliures: error));
       
      }, (response){
      emit(ForegetPasswordSucsess());
      Navigator.pushReplacementNamed(context, LoginPage.id);
     });
    }
    
  }
}
