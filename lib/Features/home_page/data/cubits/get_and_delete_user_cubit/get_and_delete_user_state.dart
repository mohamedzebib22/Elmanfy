import 'package:elmanfy/core/errors/faliures.dart';

class GetAndDeleteUserState {}
class GetUserInitial extends GetAndDeleteUserState {}
class GetUserLoading extends GetAndDeleteUserState {}
class GetUserSucsess extends GetAndDeleteUserState {}
class GetUserFailuer extends GetAndDeleteUserState {
  final Faliures faliures;

  GetUserFailuer({required this.faliures});

}
