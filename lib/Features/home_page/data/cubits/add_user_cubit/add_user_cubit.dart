import 'package:bloc/bloc.dart';
import 'package:elmanfy/features/home_page/data/Repos/add_user/add_user_repo.dart';
import 'package:elmanfy/features/home_page/data/cubits/add_user_cubit/add_user_state.dart';
import 'package:elmanfy/core/errors/faliures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddUserCubit extends Cubit<AddUserState> {
  AddUserCubit(this.addUserRepo) : super(AddUserInitial());
  final AddUserRepo addUserRepo;
  var selectDate;
  String userCollection = 'Users';

  static AddUserCubit get(context) => BlocProvider.of(context);
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController dateOfAdded = TextEditingController();

  addUser({required BuildContext context}) async {
    emit(AddUserLoading());
    var either = await addUserRepo.addUser(
        name: name.text.trim(),
        phone: phone.text.trim(),
        dateOfAdded: dateOfAdded.text);
    return either.fold((error) {
      print('========User Not Added===========');
      emit(AddUserFaliure(faliures: error));
    }, (response) {
      print('========UserAdded Sucsess===========');
      emit(AddUserSucsess());
      Navigator.pop(context);
    });
  }

   chooseDate({required BuildContext context}) async {
   var either =await addUserRepo.chooseDate(context: context );
   return either.fold((error){
    print('========date Not Added===========');
    emit(AddUserFaliure(faliures: error));
   }, (response){
    print('========date Added Sucsess===========');
    dateOfAdded.text = response;
    emit(AddUserSucsess());
   });
  }
}
