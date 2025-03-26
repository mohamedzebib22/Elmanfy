import 'package:elmanfy/core/errors/faliures.dart';

abstract class AddDeptState {}
class AddDeptInitial extends AddDeptState {}
class AddDeptLoading extends AddDeptState {}
class AddDeptSucsess extends AddDeptState {}
class AddDeptFailure extends AddDeptState {
  final Faliures faliures ;

  AddDeptFailure({required this.faliures});
}
