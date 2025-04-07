import 'package:dartz/dartz.dart';
import 'package:elmanfy/Features/home_page/data/Data_Source/add_user/add_user_remote.dart';
import 'package:elmanfy/Features/home_page/data/Repos/add_user/add_user_repo.dart';
import 'package:elmanfy/core/errors/faliures.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddUserRepo)
class AddUserImpl implements AddUserRepo {
  final AddUserRemote addUserRemote;

  AddUserImpl({required this.addUserRemote});
  @override
  Future<Either<Faliures, void>> addUser({required String name ,required String phone,required String dateOfAdded}) async{
     var either = await addUserRemote.addUser(name: name, phone: phone, dateOfAdded: dateOfAdded);
     return either.fold((error)=>Left(error), (response) =>Right(response));
  }
  
  @override
  Future<Either<Faliures, void>> addDept({required String userId,required String nameOfPiece, required int price, required int count, required String dateOfAdded, required int totalPrice})async {
    var either = await addUserRemote.addDept(userId: userId, nameOfPiece: nameOfPiece, price: price, count: count, dateOfAdded: dateOfAdded, totalPrice: totalPrice);
    return either.fold((error)=>Left(error), (response)=>Right(response));
  }
  
  @override
  Future<Either<Faliures, dynamic>> getDepts({required String userId}) async{
    var either = await addUserRemote.getDepts(userId: userId);
    return either.fold((error)=>Left(error) , (response)=>Right(response));
  }
  
  @override
  Future<Either<Faliures, dynamic>> chooseDate({required BuildContext context}) async{
    var either = await addUserRemote.chooseDate(context: context);
    return either.fold((error)=> Left(error), (response)=>Right(response));
  }
  
  @override
  Future<Either<Faliures, void>> debtsPaidDone({required String deptID,required String userId,required String nameOfPiece ,required int price,required int count,required String dateOfAdded,required int totalPrice}) async{
    var either = await addUserRemote.debtsPaidDone(deptID: deptID, userId: userId, nameOfPiece: nameOfPiece, price: price, count: count, dateOfAdded: dateOfAdded, totalPrice: totalPrice);
    return either.fold((error)=>Left(error), (response)=>Right(response));
  }

}