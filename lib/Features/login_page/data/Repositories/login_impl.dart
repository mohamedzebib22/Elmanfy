import 'package:dartz/dartz.dart';
import 'package:elmanfy/features/login_page/data/Data_Source/remote/login_remote.dart';
import 'package:elmanfy/features/login_page/data/Repositories/login_repo.dart';
import 'package:elmanfy/core/errors/faliures.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:LoginRepo )
class LoginImpl implements LoginRepo{
  final LoginRemote loginRemote;

  LoginImpl({required this.loginRemote});
  @override
  Future<Either<Faliures, dynamic>> loginUser({required String email, required String password}) async{
   var either = await loginRemote.loginUser(email: email, password: password);
   return either.fold((error)=>Left(error), (response) => Right(response));
  }

}