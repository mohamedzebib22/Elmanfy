import 'package:bloc/bloc.dart';
import 'package:elmanfy/Features/home_page/data/Repos/add_user/add_user_repo.dart';
import 'package:elmanfy/Features/home_page/data/cubits/dept_paid_done/dept_paid_done_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeptPaidDoneCubit extends Cubit<DeptPaidDoneState> {
  DeptPaidDoneCubit(this.addUserRepo) : super(DeptPaidDoneInitial());
  final AddUserRepo addUserRepo;
  deptDone({required String deptId,
   required String userId,
   required String nameOfPiece,
   required int price,
   required int count,
   required String dateOfAdded,
   required int totalPrice,
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