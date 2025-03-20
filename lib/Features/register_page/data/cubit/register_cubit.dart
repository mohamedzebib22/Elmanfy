import 'package:bloc/bloc.dart';
import 'package:elmanfy/Features/home_page/presentation/views/screens/home_page.dart';
import 'package:elmanfy/Features/register_page/data/Repositories/register_repositories.dart';
import 'package:elmanfy/Features/register_page/data/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitial());
  final RegisterRepo registerRepo;

  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  TextEditingController userRePaswword = TextEditingController();
  var formkey = GlobalKey<FormState>();

  static RegisterCubit get(context) => BlocProvider.of(context);

  register(
      {
      required BuildContext context}) async {
    emit(RegisterLoading());
    var either =
        await registerRepo.registerUser(email: userEmail.text, password: userPassword.text);
    return either.fold((error) {
      emit(RegisterFailuer(faliures: error));
    }, (response) {
      emit(RegisterSucsess());
      Navigator.pushReplacementNamed(context, HomePage.id);
    });
  }
}
