import 'package:dartz/dartz.dart';
import 'package:elmanfy/features/home_page/data/Data_Source/get_and_delete_user/get_and_delete_user_remote.dart';
import 'package:elmanfy/features/home_page/data/Repos/get_user/get_user_repo.dart';
import 'package:elmanfy/core/errors/faliures.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:GetUserRepo )
class GetUserImpl implements GetUserRepo{
  final GetUserRemote getUserRemote;

  GetUserImpl({required this.getUserRemote});
  @override
  Future<Either<Faliures, dynamic>> getUsers() async{
    var either = await getUserRemote.getUsers();
    return either.fold((error)=>Left(error), (response) =>Right(response));
  }
  
  @override
  Future<Either<Faliures, dynamic>> deleteUsers({required String id}) async{
   var either = await getUserRemote.deleteUsers(id: id);
   return either.fold((error)=>Left(error), (response)=>Right(response));
  }

}
