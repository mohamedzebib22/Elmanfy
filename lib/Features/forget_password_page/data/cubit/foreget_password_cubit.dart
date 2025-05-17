import 'package:bloc/bloc.dart';
import 'package:elmanfy/features/forget_password_page/data/Repositories/forget_passwod_repo.dart';
import 'package:elmanfy/features/forget_password_page/data/cubit/foreget_password_state.dart';
import 'package:elmanfy/core/utils/widgets/show_dialog_msg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quickalert/quickalert.dart';

@injectable
class ForegetPasswordCubit extends Cubit<ForegetPasswordState> {
  ForegetPasswordCubit(this.forgetPasswodRepo)
      : super(ForegetPasswordInitial());
  final ForgetPasswordRepo forgetPasswodRepo;
  TextEditingController email = TextEditingController();

  var keyFormState = GlobalKey<FormState>();

  static ForegetPasswordCubit get(context) => BlocProvider.of(context);

  foregetPassword({required BuildContext context}) async {
    emit(ForegetPasswordLoading());
    var either = await forgetPasswodRepo.forgetPassword(email: email.text);
    return either.fold((error) {
      print('======== Dont Send Email =========');
      emit(ForegetPasswordFaliure(faliures: error));
      ShowDialogMsg.showDialogtext(
          context: context,
          type: QuickAlertType.error,
          title: 'ارسال الرمز',
          body: error.errMessage,
          confirm: () {});
    }, (response) {
      print('========Send Email Sucsess=========');
      emit(ForegetPasswordSucsess());
      ShowDialogMsg.showDialogtext(
          context: context,
          type: QuickAlertType.confirm,
          title: 'ارسال الرمز',
          body: response.toString(),
          confirm: () {});
    });
  }
}
