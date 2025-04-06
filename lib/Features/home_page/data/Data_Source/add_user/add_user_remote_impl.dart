import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:elmanfy/Features/home_page/data/Data_Source/add_user/add_user_remote.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/errors/faliures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddUserRemote)
class AddUserRemoteImpl implements AddUserRemote {
  @override
  Future<Either<Faliures, void>> addUser(
      {required String name,
      required String phone,
      required String dateOfAdded}) async {
      
      String uid = FirebaseAuth.instance.currentUser!.uid;
      DocumentReference  users = FirebaseFirestore.instance.collection(Constant.adminCollection).doc(uid).collection(Constant.collectionUsers).doc();
       String userId = users.id;
    try {
      await users
          .set({
          'full_name': name, 
          'phone': phone, 
          'dateOfAdded': dateOfAdded ,
          'id' : userId});

        return const Right(null);
    } catch (e) {
      return Left(ServerError(errMessage: e.toString()));
    }
  }
  
  @override
  Future<Either<Faliures, void>> addDept({required String userId,required String nameOfPiece, required int price, required int count, required String dateOfAdded, required int totalPrice})async {
    try{
       CollectionReference debts = FirebaseFirestore.instance
          .collection(Constant.adminCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection(Constant.collectionUsers)
          .doc(userId)
          .collection(Constant.collectionDepts);

        await debts.add({
        'itemName': nameOfPiece,
        'itemPrice': price,
        'quantity': count,
        'totalPrice': price * count,
        'debtDate': dateOfAdded,
      });

      return const Right(null);
    }catch(e){
      return Left(ServerError(errMessage: e.toString()));
    }
  }
  
  @override
  Future<Either<Faliures, dynamic>> getDepts({required String userId}) async{
    try {
    CollectionReference debts = FirebaseFirestore.instance
        .collection(Constant.adminCollection)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(Constant.collectionUsers)
        .doc(userId)
        .collection(Constant.collectionDepts);
    QuerySnapshot querySnapshot = await debts.get();
    return Right(querySnapshot.docs);
       
  }catch (e){
    return Left(ServerError(errMessage: e.toString()));
  }
}

  @override
  Future<Either<Faliures, dynamic>> chooseDate({required BuildContext context}) async{
    try{
      var date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    String  formatDate = '${date!.day}/${date.month}/${date.year}';
    return  Right(formatDate);
    
    }catch(e){
      return Left(ServerError(errMessage: e.toString()));
    }
  }
}