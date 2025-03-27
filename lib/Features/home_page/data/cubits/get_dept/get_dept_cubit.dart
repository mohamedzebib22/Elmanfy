import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elmanfy/Features/home_page/data/Repos/add_user/add_user_repo.dart';
import 'package:elmanfy/Features/home_page/data/cubits/get_dept/get_dept_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@injectable
class GetDeptCubit extends Cubit<GetDeptState> {
  GetDeptCubit(this.addUserRepo) : super(GetDeptInitial());
  final AddUserRepo addUserRepo;
  List<QueryDocumentSnapshot> data = [];
  getDepts({required String userId})async{
    emit(GetDeptLodaing());
    var either = await addUserRepo.getDepts(userId: userId);
    return either.fold((error){
      emit(GetDeptFaliure(faliures: error));
    }, (response){
      data.addAll(response);
      emit(GetDeptSucsess());
    });
  }
}
