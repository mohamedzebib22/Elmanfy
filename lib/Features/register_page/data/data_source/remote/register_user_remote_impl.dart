import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:elmanfy/Features/home_page/presentation/views/screens/home_page.dart';
import 'package:elmanfy/Features/register_page/data/data_source/remote/register_user_remote.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/errors/faliures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';


@Injectable(as:RegisterUserRemote )
class RegisterUserRemoteImpl implements RegisterUserRemote {
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
  
  @override
  Future<Either<Faliures, void>> addAdminUserToFirestore({required String name, required String email})async {
    DocumentReference  admin = FirebaseFirestore.instance.collection(Constant.adminCollection).doc(FirebaseAuth.instance.currentUser!.uid);
    try{
      await admin
          .set({
          'name': name,  
          'email': email,
          'id' : FirebaseAuth.instance.currentUser!.uid
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));

        return const Right(null);
    }catch(e){
      return Left(ServerError(errMessage: e.toString()));
    }
  }
}

