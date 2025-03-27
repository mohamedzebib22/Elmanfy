import 'package:elmanfy/core/errors/faliures.dart';

abstract class GetDeptState {}
class GetDeptInitial extends GetDeptState {}
class GetDeptLodaing extends GetDeptState {}
class GetDeptSucsess extends GetDeptState {}
class GetDeptFaliure extends GetDeptState {
  final Faliures faliures;

  GetDeptFaliure({required this.faliures});
  
}
