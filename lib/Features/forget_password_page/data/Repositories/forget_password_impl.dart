import 'package:dartz/dartz.dart';
import 'package:elmanfy/Features/forget_password_page/data/Data_Source/remote/foreget_password_impl.dart';
import 'package:elmanfy/Features/forget_password_page/data/Data_Source/remote/forget_password_remote.dart';
import 'package:elmanfy/Features/forget_password_page/data/Repositories/forget_passwod_repo.dart';
import 'package:elmanfy/core/errors/faliures.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:ForgetPasswordRepo )
class ForgetPasswordImpl extends ForgetPasswordRepo{
  final ForgetPasswordRemote forgetPasswordRemote;

  ForgetPasswordImpl({required this.forgetPasswordRemote});
  @override
  Future<Either<Faliures, dynamic>> forgetPassword({required String email})async {
    var either = await forgetPasswordRemote.forgetPassword(email: email);
    return either.fold((error) =>Left(error), (response) =>Right(response));
  }

}