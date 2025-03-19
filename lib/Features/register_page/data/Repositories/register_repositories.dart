import 'package:dartz/dartz.dart';
import 'package:elmanfy/core/errors/faliures.dart';

abstract class RegisterRepo {
  Future<Either<Faliures,dynamic>> registerUser({required String email , required String password});
}