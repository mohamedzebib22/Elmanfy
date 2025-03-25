import 'package:dartz/dartz.dart';
import 'package:elmanfy/core/errors/faliures.dart';

abstract class RegisterUserRemote {
  Future<Either<Faliures,dynamic>> registerUser({required String email , required String password});
  Future<Either<Faliures,void>> addAdminUserToFirestore({required String name ,required String email});

}