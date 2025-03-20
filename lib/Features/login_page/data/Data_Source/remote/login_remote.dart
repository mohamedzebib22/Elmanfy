import 'package:dartz/dartz.dart';
import 'package:elmanfy/core/errors/faliures.dart';

abstract class LoginRemote {
  Future<Either<Faliures,dynamic>> loginUser({required String email , required String password});
}