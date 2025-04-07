 import 'package:elmanfy/core/errors/faliures.dart';

class DeptPaidDoneState {}

class DeptPaidDoneInitial extends DeptPaidDoneState {}
class DeptPaidDoneLoading extends DeptPaidDoneState {}
class DeptPaidDoneSucsess extends DeptPaidDoneState {}
class DeptPaidDoneFaliure extends DeptPaidDoneState {
  final Faliures faliures;

  DeptPaidDoneFaliure({required this.faliures});

}
