import 'package:bloc/bloc.dart';
import 'package:elmanfy/features/home_page/data/Repos/add_user/add_user_repo.dart';
import 'package:elmanfy/features/home_page/data/cubits/cubit/delete_dept_cubit.dart';
import 'package:elmanfy/features/home_page/data/cubits/dept_paid_done/dept_paid_done_state.dart';
import 'package:elmanfy/features/home_page/data/cubits/get_dept/get_dept_cubit.dart';
import 'package:elmanfy/features/home_page/data/cubits/get_dept_done/get_depts_done_cubit.dart';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeptPaidDoneCubit extends Cubit<DeptPaidDoneState> {
  DeptPaidDoneCubit(this.addUserRepo) : super(DeptPaidDoneInitial());
  // DeleteDeptCubit deleteItem = getIt<>(); 
  TextEditingController controller = TextEditingController();
  final AddUserRepo addUserRepo;
  totalPayment({required String deptId,
   required String userId,
   required String nameOfPiece,
   required int price,
   required int count,
   required String dateOfAdded,
   required int totalPrice,
   required String fullName,
   required String phone,
   required BuildContext context
   })async{

    emit(DeptPaidDoneLoading());
    var either = await addUserRepo.debtsPaidDone(deptID: deptId,
     userId: userId, 
     nameOfPiece: nameOfPiece,
      price: price, count: count, 
      dateOfAdded: dateOfAdded,
       totalPrice: totalPrice);
    return either.fold((error){
      print('=======No Dept Paided==========');
      print('=======${error.errMessage}==========');
      emit(DeptPaidDoneFaliure(faliures: error));
    }, (response){
    print('=======Done Dept==========');
      emit(DeptPaidDoneSucsess());
     DeleteDeptCubit.get(context).deleteDeptFromFireStore(userId: userId, deptId: deptId,  context: context);
     // Navigator.pop(context);
    });
  }
  partialPaymentDone({
    required String deptId,
  required String userId,
  required String nameOfPiece,
  required int price,
  required int count,
  required String dateOfAdded,
  required int totalPrice,
  required int paidAmount,
 
  required BuildContext context
  })async{
    final getDeptCubit = GetDeptCubit.get(context);
    var either =await addUserRepo.partialPayment(deptId: deptId, userId: userId, nameOfPiece: nameOfPiece, price: price, count: count, dateOfAdded: dateOfAdded, totalPrice: totalPrice, paidAmount: paidAmount);
    return either.fold((error){
       print('=======No partialPaymentDone==========');
      print('=======${error.errMessage}==========');
      emit(DeptPaidDoneFaliure(faliures: error));
    }, (response){
       print('=======partialPaymentDone==========');
      emit(DeptPaidDoneSucsess());
      getDeptCubit.getDepts(userId: userId);
      

    });
  }
}
/**
  nameOfPiece: nameOfPiece.text,
      price:int.tryParse(price.text) ?? 0,
      count: int.tryParse(count.text) ?? 0,
      dateOfAdded: dateOfAdded.text,
      totalPrice: int.tryParse(totalPrice.text) ?? 0);
 */

