import 'package:dartz/dartz.dart';
import 'package:elmanfy/core/errors/faliures.dart';

abstract class AddUserRemote {
  Future<Either<Faliures,void>> addUser({required String name ,required String phone,required String dateOfAdded});
}