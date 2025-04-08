import 'package:elmanfy/core/errors/faliures.dart';

class GetDeptsDoneState {}

class GetDeptsDoneInitial extends GetDeptsDoneState {}
class GetDeptsDoneLoading extends GetDeptsDoneState {}
class GetDeptsDoneSucsess extends GetDeptsDoneState {}
class GetDeptsDoneFaluire extends GetDeptsDoneState {
  final Faliures faliures;

  GetDeptsDoneFaluire({required this.faliures});
}
