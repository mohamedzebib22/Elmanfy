import 'package:bloc/bloc.dart';
import 'package:elmanfy/features/home_page/presentation/views/screens/home_page.dart';
import 'package:elmanfy/features/register_page/data/Repositories/register_repositories.dart';
import 'package:elmanfy/features/register_page/data/cubit/register_state.dart';
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
        await registerRepo.registerUser(email: userEmail.text.trim(), password: userPassword.text);
    return either.fold((error) {
      emit(RegisterFailuer(faliures: error));
    }, (response) {
      emit(RegisterSucsess());
     
      Navigator.pushReplacementNamed(context, HomePage.id);
    });
  }
  addAdminToFirestore()async{
    var either = await registerRepo.addAdminUserToFirestore(name: userName.text.trim(), email: userEmail.text.trim());
    return either.fold((error){
      print('======User Collection Not Added ==========');
      emit(RegisterFailuer(faliures: error));
    }, (response){
      print('======User Collection Added Sucsess==========');
      emit(RegisterSucsess());
    });
  }
}
