import 'package:dartz/dartz.dart';
import 'package:elmanfy/features/forget_password_page/data/Data_Source/remote/forget_password_remote.dart';
import 'package:elmanfy/core/errors/faliures.dart';
import 'package:elmanfy/core/utils/widgets/show_dialog_msg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetPasswordRemote)
class ForgetPasswordImpl implements ForgetPasswordRemote {
  @override
  Future<Either<Faliures, dynamic>> forgetPassword(
      {required String email}) async {
    try {
     
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const Right('تم ارسال الرمز الى البريد الالكترونى');
    } catch (e) {
     
       if (e is FirebaseAuthException) {
        
        if (e.code == 'user-not-found') {
          return Left(ServerError(errMessage: 'البريد الإلكتروني غير موجود في النظام'));
        } else if (e.code == 'invalid-email') {
          return Left(ServerError(errMessage: 'البريد الإلكتروني غير صالح'));
        }
      }
      return Left(ServerError(errMessage: e.toString()));
    }
  }
}
