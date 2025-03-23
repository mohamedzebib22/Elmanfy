import 'package:elmanfy/core/errors/faliures.dart';

class GetUserState {}
class GetUserInitial extends GetUserState {}
class GetUserLoading extends GetUserState {}
class GetUserSucsess extends GetUserState {}
class GetUserFailuer extends GetUserState {
  final Faliures faliures;

  GetUserFailuer({required this.faliures});

}
