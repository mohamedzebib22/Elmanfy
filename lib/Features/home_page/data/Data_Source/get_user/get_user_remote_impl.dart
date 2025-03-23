import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:elmanfy/Features/home_page/data/Data_Source/get_user/get_user_remote.dart';
import 'package:elmanfy/Features/home_page/data/cubits/get_user_cubit/get_user_cubit.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/errors/faliures.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetUserRemote)
class GetUserRemoteImpl extends GetUserRemote{
  @override
  Future<Either<Faliures, dynamic>> getUsers() async{
  
   try{
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(Constant.getCollection).get();
    
    return  Right(querySnapshot.docs);
   }catch(e){
    return Left(ServerError(errMessage: e.toString()));
   }
    

  }

}