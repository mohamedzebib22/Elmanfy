import 'package:elmanfy/core/errors/faliures.dart';

class DeleteDeptState {}

class DeleteDeptInitial extends DeleteDeptState {}
class DeleteDeptLoading extends DeleteDeptState {}
class DeleteDeptSucsess extends DeleteDeptState {}
class DeleteDeptFaliures extends DeleteDeptState {
  final Faliures faliures;

  DeleteDeptFaliures({required this.faliures});

}
