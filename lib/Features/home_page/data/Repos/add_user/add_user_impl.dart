import 'package:dartz/dartz.dart';
import 'package:elmanfy/Features/home_page/data/Data_Source/add_user/add_user_remote.dart';
import 'package:elmanfy/Features/home_page/data/Repos/add_user/add_user_repo.dart';
import 'package:elmanfy/core/errors/faliures.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddUserRepo)
class AddUserImpl extends AddUserRepo {
  final AddUserRemote addUserRemote;

  AddUserImpl({required this.addUserRemote});
  @override
  Future<Either<Faliures, void>> addUser({required String name ,required String phone,required String dateOfAdded}) async{
     var either = await addUserRemote.addUser(name: name, phone: phone, dateOfAdded: dateOfAdded);
     return either.fold((error)=>Left(error), (response) =>Right(response));
  }
  
  @override
  Future<Either<Faliures, void>> addDept({required String userId,required String nameOfPiece, required int price, required int count, required String dateOfAdded, required int totalPrice}) {
    // TODO: implement addDept
    throw UnimplementedError();
  }

}