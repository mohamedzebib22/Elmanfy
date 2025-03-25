import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:elmanfy/Features/home_page/data/Data_Source/add_user/add_user_remote.dart';
import 'package:elmanfy/core/constants/constant.dart';
import 'package:elmanfy/core/errors/faliures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddUserRemote)
class AddUserRemoteImpl extends AddUserRemote {
  @override
  Future<Either<Faliures, void>> addUser(
      {required String name,
      required String phone,
      required String dateOfAdded}) async {
      
      String uid = FirebaseAuth.instance.currentUser!.uid;
      CollectionReference users = FirebaseFirestore.instance.collection(Constant.getCollection).doc(uid).collection(Constant.collectionDept);
    try {
      await users
          .add({'full_name': name, 'phone': phone, 'dateOfAdded': dateOfAdded ,'id' : uid});

        return const Right(null);
    } catch (e) {
      return Left(ServerError(errMessage: e.toString()));
    }
  }
}
