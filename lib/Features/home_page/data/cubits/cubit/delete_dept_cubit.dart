import 'package:bloc/bloc.dart';
import 'package:elmanfy/Features/home_page/data/Repos/add_user/add_user_repo.dart';
import 'package:elmanfy/Features/home_page/data/cubits/cubit/delete_dept_state.dart';
import 'package:elmanfy/Features/home_page/data/cubits/get_dept/get_dept_cubit.dart';
import 'package:elmanfy/Features/home_page/data/cubits/get_dept_done/get_depts_done_cubit.dart';
import 'package:elmanfy/Features/home_page/presentation/views/screens/customer_details_page.dart';
import 'package:elmanfy/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteDeptCubit extends Cubit<DeleteDeptState> {
  DeleteDeptCubit(this.addUserRepo) : super(DeleteDeptInitial());
  final AddUserRepo addUserRepo;
  GetDeptCubit getDept = getIt<GetDeptCubit>();
  static DeleteDeptCubit get(context) => BlocProvider.of(context);

  deleteDeptFromFireStore(
      {required String userId,
      required String deptId,
      required String fullName,
      required String phone,
      required String dateOfAdded,
      required BuildContext context,
      }) async {
    emit(DeleteDeptLoading());
    var either =
        await addUserRepo.deleteDeptDone(userId: userId, deptId: deptId);
    return either.fold((error) {
      emit(DeleteDeptFaliures(faliures: error));
    }, (response) {
      emit(DeleteDeptSucsess());
      // GetDeptCubit.get(context).getDepts(userId: userId);
      // getDept.getDepts(userId: userId);
      Navigator.pushReplacementNamed(
        context,
        CustomerdetailsPage.id,
        arguments: {"id": userId,"full_name":fullName,"phone":phone,"dateOfAdded":dateOfAdded},
      );
    });
  }
}
