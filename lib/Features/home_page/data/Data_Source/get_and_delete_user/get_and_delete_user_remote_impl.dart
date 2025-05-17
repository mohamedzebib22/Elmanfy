import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:elmanfy/features/home_page/data/Data_Source/get_and_delete_user/get_and_delete_user_remote.dart';
import 'package:elmanfy/features/home_page/data/cubits/get_and_delete_user_cubit/get_and_delete_user_cubit.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/errors/faliures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetUserRemote)
class GetUserRemoteImpl implements GetUserRemote{
  @override
  Future<Either<Faliures, dynamic>> getUsers() async{
  
   try{
    String uid = FirebaseAuth.instance.currentUser!.uid;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(Constant.adminCollection).doc(uid).collection(Constant.collectionUsers).get();
    return  Right(querySnapshot.docs);
   }catch(e){
    return Left(ServerError(errMessage: e.toString()));
   }
    

  }
  
  @override
  Future<Either<Faliures, dynamic>> deleteUsers({required String id}) async{
    try{
       String uid = FirebaseAuth.instance.currentUser!.uid;

       await FirebaseFirestore.instance.collection(Constant.adminCollection).doc(uid).collection(Constant.collectionUsers).doc(id).delete();
    return Right(null) ;
    }catch(e){
     if (e is FirebaseException) {

      return Left(ServerError(errMessage: "Firebase error: ${e.message}"));
    } else {
      return Left(ServerError(errMessage: "Unknown error: ${e.toString()}"));
    }
    }
   
  } 

}