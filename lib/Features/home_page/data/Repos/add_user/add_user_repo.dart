import 'package:dartz/dartz.dart';
import 'package:elmanfy/core/errors/faliures.dart';

abstract class  AddUserRepo {
  Future<Either<Faliures,void>> addUser({required String name ,required String phone,required String dateOfAdded});
  Future<Either<Faliures,void>> addDept({required String userId,required String nameOfPiece ,required int price,required int count,required String dateOfAdded,required int totalPrice});
  Future<Either<Faliures,dynamic>> getDepts({required String userId});
}
