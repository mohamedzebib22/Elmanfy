import 'package:elmanfy/core/errors/faliures.dart';

class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSucsess extends LoginState {}
class LoginFailure extends LoginState {
  final Faliures faliures;

  LoginFailure({required this.faliures});
}
