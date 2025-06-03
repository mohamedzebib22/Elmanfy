import 'package:dartz/dartz.dart';
import 'package:elmanfy/core/errors/faliures.dart';
import 'package:flutter/material.dart';

abstract class AddUserRemote {
  Future<Either<Faliures, void>> addUser(
      {required String name,
      required String phone,
      required String dateOfAdded});
  Future<Either<Faliures, void>> addDept(
      {required String userId,
      required String nameOfPiece,
      required int price,
      required int count,
      required String dateOfAdded,
      required int totalPrice});
  Future<Either<Faliures, dynamic>> getDepts({required String userId});
  Future<Either<Faliures, dynamic>> chooseDate({
    required BuildContext context,
  });


  Future<Either<Faliures, void>> debtsPaidDone(
      {required String deptID,
      required String userId,
      required String nameOfPiece,
      required int price,
      required int count,
      required String dateOfAdded,
      required int totalPrice});

  Future<Either<Faliures,dynamic>> getDeptsDone({required String userId});
  Future<Either<Faliures, void>> deleteDeptDone({required String userId, required String deptId});
  Future<Either<Faliures, void>> partialPayment({
  required String deptId,
  required String userId,
  required String nameOfPiece,
  required int price,
  required int count,
  required String dateOfAdded,
  required int totalPrice,
  required int paidAmount,
});

}
