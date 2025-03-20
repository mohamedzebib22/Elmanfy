import 'package:dartz/dartz.dart';
import 'package:elmanfy/Features/forget_password_page/data/Data_Source/remote/forget_password_remote.dart';
import 'package:elmanfy/core/errors/faliures.dart';
import 'package:elmanfy/core/utils/widgets/show_dialog_msg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:quickalert/quickalert.dart';

@Injectable(as: ForgetPasswordRemote)
class ForegetPasswordImpl extends ForgetPasswordRemote{
  @override
  Future<Either<Faliures, dynamic>> forgetPassword({required String email})async {
    try{
     await  FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return Right('Password reset email sent successfully');
    }catch(e){
      return Left(ServerError(errMessage: e.toString()));
    }
  }
}