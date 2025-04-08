import 'package:bloc/bloc.dart';
import 'package:elmanfy/Features/home_page/data/Repos/add_user/add_user_repo.dart';
import 'package:elmanfy/Features/home_page/data/cubits/cubit/delete_dept_state.dart';
import 'package:elmanfy/Features/home_page/data/cubits/get_dept/get_dept_cubit.dart';
import 'package:elmanfy/Features/home_page/data/cubits/get_dept_done/get_depts_done_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteDeptCubit extends Cubit<DeleteDeptState> {
  DeleteDeptCubit(this.addUserRepo) : super(DeleteDeptInitial());
  final AddUserRepo addUserRepo;

  static DeleteDeptCubit get(context) => BlocProvider.of(context);

  deleteDeptFromFireStore({required String userId, required String deptId,required BuildContext context})async{
    emit(DeleteDeptLoading());
    var either =await addUserRepo.deleteDeptDone(userId: userId, deptId: deptId);
    return either.fold((error){
      emit(DeleteDeptFaliures(faliures: error));
    }, (response){
      emit(DeleteDeptSucsess());
      GetDeptCubit.get(context).getDepts(userId: userId);
    
    });
  }
}
