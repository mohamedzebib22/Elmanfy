import 'package:dartz/dartz.dart';
import 'package:elmanfy/core/errors/faliures.dart';

abstract class ForgetPasswordRemote {
  Future<Either<Faliures,dynamic>> forgetPassword({required String email});
}