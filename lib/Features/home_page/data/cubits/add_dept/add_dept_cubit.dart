import 'package:bloc/bloc.dart';
import 'package:elmanfy/Features/home_page/data/Repos/add_user/add_user_repo.dart';
import 'package:elmanfy/Features/home_page/data/cubits/add_dept/add_dept_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  //static AddDeptCubit get(context) => BlocProvider.of(context);
  addDepts({required String id,required BuildContext context})async{
    emit(AddDeptLoading());
    var either = await addUserRepo.addDept(userId: id,
     nameOfPiece: nameOfPiece.text,
      price:int.tryParse(price.text) ?? 0,
      count: int.tryParse(count.text) ?? 0,
      dateOfAdded: dateOfAdded.text,
      totalPrice: int.tryParse(totalPrice.text) ?? 0);
    return either.fold((error){
      print('=============Dept Not Added ==============');
      emit(AddDeptFailure(faliures: error));
    },(response){
      print('=============Dept Added Sucsess==============');
      emit(AddDeptSucsess());
      Navigator.pop(context);
    });
  }
  chooseDate({required BuildContext context}) async {
   var either =await addUserRepo.chooseDate(context: context );
   return either.fold((error){
    print('========date Not Added===========');
    emit(AddDeptFailure(faliures: error));
   }, (response){
    print('========date Added Sucsess===========');
    dateOfAdded.text = response;
    emit(AddDeptSucsess());
   });
  }
}
