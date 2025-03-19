import 'package:dartz/dartz.dart';
import 'package:elmanfy/Features/home_page/presentation/views/screens/home_page.dart';
import 'package:elmanfy/Features/register_page/data/data_source/remote/register_user_remote.dart';
import 'package:elmanfy/core/errors/faliures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';


@Injectable(as:RegisterUserRemote )
class RegisterUserRemoteImpl extends RegisterUserRemote {
  @override
  Future<Either<Faliures, dynamic>> registerUser({required String email , required String password,context}) async{
   try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('=============RegisterSucsess==========');
     
      return Right(credential);
      
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return Left(Faliures(errMessage: 'the password provided is too weak'));
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return Left(Faliures(errMessage:'The account already exists for that email.' ));
      }
    } catch (e) {
      return Left(Faliures(errMessage: e.toString()));
    }
     return Left(Faliures(errMessage: 'An unexpected error occurred.'));
  }
}