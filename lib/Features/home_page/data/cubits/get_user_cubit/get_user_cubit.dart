import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elmanfy/Features/home_page/data/Repos/get_user/get_user_repo.dart';
import 'package:elmanfy/Features/home_page/data/cubits/get_user_cubit/get_user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserCubit extends Cubit<GetUserState> {
  GetUserCubit(this.getUserRepo) : super(GetUserInitial());
  final GetUserRepo getUserRepo;
  List<QueryDocumentSnapshot> data = [];

  //static GetUserCubit get(context) => BlocProvider.of(context);

  getUsersFromeFireStore({required BuildContext context}) async {
    emit(GetUserLoading());
    var either = await getUserRepo.getUsers();
    return either.fold((error) {
      emit(GetUserFailuer(faliures: error));
    }, (response) {
      data.addAll(response);

      emit(GetUserSucsess());
    });
  }
}
