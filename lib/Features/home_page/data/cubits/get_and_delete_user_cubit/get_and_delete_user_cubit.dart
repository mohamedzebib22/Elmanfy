import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elmanfy/Features/home_page/data/Repos/get_user/get_user_repo.dart';
import 'package:elmanfy/Features/home_page/data/cubits/get_and_delete_user_cubit/get_and_delete_user_state.dart';
import 'package:elmanfy/Features/home_page/presentation/views/screens/home_page.dart';
import 'package:elmanfy/Features/login_page/presentation/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserCubit extends Cubit<GetAndDeleteUserState> {
  GetUserCubit(this.getUserRepo) : super(GetUserInitial());
  final GetUserRepo getUserRepo;
  List<QueryDocumentSnapshot> data = [];

  //static GetUserCubit get(context) => BlocProvider.of(context);

  getUsersFromeFireStore() async {
    emit(GetUserLoading());
    var either = await getUserRepo.getUsers();
    return either.fold((error) {
      emit(GetUserFailuer(faliures: error));
    }, (response) {
      data.addAll(response);

      emit(GetUserSucsess());
    });
  }
  deleteUser({required String id,required BuildContext context})async{
    var either = await getUserRepo.deleteUsers(id: id);
    return either.fold((error){
      print('==========User Dont Delete===========');
      emit(GetUserFailuer(faliures: error));
    }, (response){
      print('==========User Delete Sucsess===========');
      emit(GetUserSucsess());
      Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (route) => false);
    });
  }
}

