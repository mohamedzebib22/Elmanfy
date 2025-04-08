import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elmanfy/Features/home_page/data/Repos/add_user/add_user_repo.dart';
import 'package:elmanfy/Features/home_page/data/cubits/get_dept_done/get_depts_done_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetDeptsDoneCubit extends Cubit<GetDeptsDoneState> {
  GetDeptsDoneCubit(this.addUserRepo) : super(GetDeptsDoneInitial());
  final AddUserRepo addUserRepo;
  List<QueryDocumentSnapshot> data = [];
 static GetDeptsDoneCubit get(context) => BlocProvider.of(context);
  getDeptsDoneFromFireStore({required String userId})async{
    emit(GetDeptsDoneLoading());
    var either = await addUserRepo.getDeptsDone(userId: userId);
    return either.fold((error){
      emit(GetDeptsDoneFaluire(faliures: error));
    }, (response){
      data.addAll(response);
      emit(GetDeptsDoneSucsess());
    });
  }
}
