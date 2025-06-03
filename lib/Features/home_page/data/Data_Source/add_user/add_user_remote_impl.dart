import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:elmanfy/features/home_page/data/Data_Source/add_user/add_user_remote.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/errors/faliures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddUserRemote)
class AddUserRemoteImpl implements AddUserRemote {
 @override
Future<Either<Faliures, void>> addUser({
  required String name,
  required String phone,
  required String dateOfAdded,
}) async {
  try {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    final usersRef = FirebaseFirestore.instance
        .collection(Constant.adminCollection)
        .doc(uid)
        .collection(Constant.collectionUsers);

  
    final existingByName = await usersRef
        .where('full_name', isEqualTo: name.trim())
        .get();

   
    final existingByPhone = await usersRef
        .where('phone', isEqualTo: phone.trim())
        .get();

    if (existingByName.docs.isNotEmpty || existingByPhone.docs.isNotEmpty) {
      return Left(ServerError(
          errMessage: 'المستخدم موجود بالفعل بالاسم أو رقم الهاتف'));
    }


    DocumentReference users = usersRef.doc();
    String userId = users.id;

    await users.set({
      'full_name': name,
      'phone': phone,
      'dateOfAdded': dateOfAdded,
      'id': userId,
    });

    return const Right(null);
  } catch (e) {
    return Left(ServerError(errMessage: e.toString()));
  }
}


  @override
  Future<Either<Faliures, void>> addDept(
      {required String userId,
      required String nameOfPiece,
      required int price,
      required int count,
      required String dateOfAdded,
      required int totalPrice}) async {
    try {
      CollectionReference debts = FirebaseFirestore.instance
          .collection(Constant.adminCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection(Constant.collectionUsers)
          .doc(userId)
          .collection(Constant.collectionDepts);
      DocumentReference debtDoc = debts.doc();
      await debtDoc.set({
        'itemName': nameOfPiece,
        'itemPrice': price,
        'quantity': count,
        'totalPrice': price * count,
        'debtDate': dateOfAdded,
        'id': debtDoc.id,
      });

      return const Right(null);
    } catch (e) {
      return Left(ServerError(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Faliures, dynamic>> getDepts({required String userId}) async {
    try {
      CollectionReference debts = FirebaseFirestore.instance
          .collection(Constant.adminCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection(Constant.collectionUsers)
          .doc(userId)
          .collection(Constant.collectionDepts);
      QuerySnapshot querySnapshot = await debts.orderBy('debtDate', descending: true).get();
      return Right(querySnapshot.docs);
    } catch (e) {
      return Left(ServerError(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Faliures, dynamic>> chooseDate(
      {required BuildContext context}) async {
    try {
      var date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(Duration(days: 365)));
      String formatDate = '${date!.day}/${date.month}/${date.year}';
      return Right(formatDate);
    } catch (e) {
      return Left(ServerError(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Faliures, void>> debtsPaidDone(
      {required String deptID,
      required String userId,
      required String nameOfPiece,
      required int price,
      required int count,
      required String dateOfAdded,
      required int totalPrice}) async {
    try {
      CollectionReference debtsPaidDone = FirebaseFirestore.instance
          .collection(Constant.adminCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection(Constant.collectionUsers)
          .doc(userId)
          .collection(Constant.collectionDeptPaid);

      await debtsPaidDone.add({
        'itemName': nameOfPiece,
        'itemPrice': price,
        'quantity': count,
        'totalPrice': totalPrice,
        'debtDate': dateOfAdded,
        'paidDate': DateTime.now().toString(),
      });

      return const Right(null);
    } catch (e) {
      return Left(ServerError(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Faliures, dynamic>> getDeptsDone(
      {required String userId}) async {
    try {
      CollectionReference debtsPaidDone = FirebaseFirestore.instance
          .collection(Constant.adminCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection(Constant.collectionUsers)
          .doc(userId)
          .collection(Constant.collectionDeptPaid);

      QuerySnapshot snapshot = await debtsPaidDone.orderBy('paidDate', descending: true).get();
      return Right(snapshot.docs);
    } catch (e) {
      return Left(ServerError(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Faliures, void>> deleteDeptDone(
      {required String userId, required String deptId}) async {
    try {
      await FirebaseFirestore.instance
          .collection(Constant.adminCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection(Constant.collectionUsers)
          .doc(userId)
          .collection(Constant.collectionDepts)
          .doc(deptId)
          .delete();

      return const Right(null);
    } catch (e) {
      return Left(ServerError(errMessage: e.toString()));
    }
  }
  
//-------------------------------------------------------------
  @override
Future<Either<Faliures, void>> partialPayment({
  required String deptId,
  required String userId,
  required String nameOfPiece,
  required int price,
  required int count,
  required String dateOfAdded,
  required int totalPrice,
  required int paidAmount,
}) async {
  try {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final adminRef = FirebaseFirestore.instance
        .collection(Constant.adminCollection)
        .doc(uid)
        .collection(Constant.collectionUsers)
        .doc(userId);

    final paidRef = adminRef.collection(Constant.collectionDeptPaid);
    final currentDeptRef = adminRef.collection(Constant.collectionDepts).doc(deptId);

    final remaining = totalPrice - paidAmount;
    if (remaining <= 0) {
      return Left(ServerError(errMessage: 'المبلغ المدفوع أكبر من أو يساوي إجمالي الدين'));
    }

    final newQuantity = (remaining / price).ceil();

    // 1. أضف دفعة مدفوعة جديدة
    await paidRef.add({
      'itemName': nameOfPiece,
      'itemPrice': price,
      'quantity': count,
      'totalPrice': paidAmount,
      'debtDate': dateOfAdded,
      'paidDate': DateTime.now().toString(),
    });

    // 2. احذف الدين القديم
    await currentDeptRef.delete();

    // 3. أضف دين جديد بالمبلغ المتبقي
    final newDebtRef = adminRef.collection(Constant.collectionDepts).doc();
    await newDebtRef.set({
      'itemName': nameOfPiece,
      'itemPrice': price,
      'quantity': newQuantity,
      'totalPrice': remaining,
      'debtDate': dateOfAdded,
      'id': newDebtRef.id,
    });

    return  Right('تم الدفع جزء من المبلغ قيمتة :$remaining');
  } catch (e) {
    return Left(ServerError(errMessage: e.toString()));
  }
}

}
