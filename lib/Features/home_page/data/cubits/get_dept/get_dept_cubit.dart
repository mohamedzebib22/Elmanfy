import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elmanfy/features/home_page/data/Repos/add_user/add_user_repo.dart';
import 'package:elmanfy/features/home_page/data/cubits/get_dept/get_dept_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@injectable
class GetDeptCubit extends Cubit<GetDeptState> {
  GetDeptCubit(this.addUserRepo) : super(GetDeptInitial());
  final AddUserRepo addUserRepo;
  TextEditingController filterTitle= TextEditingController();
  TextEditingController notifictionRememper= TextEditingController();

  List<QueryDocumentSnapshot> data = [];
  double totalPrice = 0.0;

  static GetDeptCubit get(context) => BlocProvider.of(context);
  
 Future<void> getDepts({required String userId})async{
   
    emit(GetDeptLodaing());
    data.clear();
   

    var either = await addUserRepo.getDepts(userId: userId);
    return either.fold((error){
      emit(GetDeptFaliure(faliures: error));
    }, (response){
      data.addAll(response);
      totalPrice = 0.0;
     for (var doc in response) {
      final value = double.tryParse(doc['totalPrice'].toString()) ?? 0.0;
      totalPrice += value;
    }
    log('The total price is :$totalPrice');
      emit(GetDeptSucsess(depts: response, totalPrice: totalPrice));
     
    });
    
    
  }

   
}

