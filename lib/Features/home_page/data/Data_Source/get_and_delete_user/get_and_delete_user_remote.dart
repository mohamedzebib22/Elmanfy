import 'package:dartz/dartz.dart';
import 'package:elmanfy/core/errors/faliures.dart';

abstract class GetUserRemote {
  Future<Either<Faliures , dynamic>> getUsers();
  Future<Either<Faliures , dynamic>> deleteUsers({required String id});
}