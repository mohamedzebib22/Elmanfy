import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elmanfy/core/errors/faliures.dart';

abstract class GetDeptState {}
class GetDeptInitial extends GetDeptState {}
class GetDeptLodaing extends GetDeptState {}
class GetDeptSucsess extends GetDeptState {
  final List<QueryDocumentSnapshot> depts;
  final double totalPrice;

  GetDeptSucsess({required this.depts, required this.totalPrice});
}
class GetDeptFaliure extends GetDeptState {
  final Faliures faliures;

  GetDeptFaliure({required this.faliures});
  
}
