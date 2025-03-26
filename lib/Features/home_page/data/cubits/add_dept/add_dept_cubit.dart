import 'package:bloc/bloc.dart';
import 'package:elmanfy/Features/home_page/data/Repos/add_user/add_user_repo.dart';
import 'package:elmanfy/Features/home_page/data/cubits/add_dept/add_dept_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddDeptCubit extends Cubit<AddDeptState> {
  AddDeptCubit(this.addUserRepo) : super(AddDeptInitial());
  TextEditingController nameOfPiece = TextEditingController();
  TextEditingController price= TextEditingController();
  TextEditingController count = TextEditingController();
  TextEditingController dateOfAdded = TextEditingController();
  TextEditingController totalPrice = TextEditingController();
  final AddUserRepo addUserRepo;

  addDepts({required String id})async{
    emit(AddDeptLoading());
    var either = await addUserRepo.addDept(userId: id, nameOfPiece: nameOfPiece.text, price:int.parse(price.text), count: int.parse(count.text), dateOfAdded: dateOfAdded.text, totalPrice: int.parse(totalPrice.text));
    return either.fold((error){
      emit(AddDeptFailure(faliures: error));
    },(response){
      emit(AddDeptSucsess());
    });
  }
}
