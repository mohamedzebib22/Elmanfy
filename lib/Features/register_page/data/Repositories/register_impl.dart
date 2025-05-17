import 'package:dartz/dartz.dart';
import 'package:elmanfy/features/register_page/data/Repositories/register_repositories.dart';
import 'package:elmanfy/features/register_page/data/data_source/remote/register_user_remote.dart';
import 'package:elmanfy/core/errors/faliures.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:RegisterRepo )
class RegisterImpl implements RegisterRepo {
  final RegisterUserRemote registerUserRemote;

  RegisterImpl({required this.registerUserRemote});
  @override
  Future<Either<Faliures, dynamic>> registerUser({required String email , required String password}) async{
    var either = await registerUserRemote.registerUser(email: email, password: password);
    return either.fold((error)=>Left(error), (response)=>Right(response));
  }
  
  @override
  Future<Either<Faliures, void>> addAdminUserToFirestore({required String name, required String email})async {
    var either = await registerUserRemote.addAdminUserToFirestore(name: name, email: email);
    return either.fold((error)=>Left(error), (response)=>Right(response));
  }
}