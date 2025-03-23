import 'package:elmanfy/core/errors/faliures.dart';

class AddUserState {}

class AddUserInitial extends AddUserState {}
class AddUserLoading extends AddUserState {}
class AddUserSucsess extends AddUserState {}
class AddUserFaliure extends AddUserState {
  final Faliures faliures;

  AddUserFaliure({required this.faliures});

}
