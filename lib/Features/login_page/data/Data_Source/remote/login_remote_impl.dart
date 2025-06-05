import 'package:dartz/dartz.dart';
import 'package:elmanfy/features/login_page/data/Data_Source/remote/login_remote.dart';
import 'package:elmanfy/core/errors/faliures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:LoginRemote )
class LoginRemoteImpl implements LoginRemote {
  @override
  Future<Either<Faliures, dynamic>> loginUser(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return Right(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Left(ServerError(errMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        return Left(ServerError(errMessage: 'Wrong password provided for that user.'));
      }else{
        return Left(ServerError(errMessage: 'Please check Email and password'));
      }
    } 
    catch (e){
      return Left(ServerError(errMessage: e.toString()));
    }
  }
}
