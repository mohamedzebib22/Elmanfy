
import 'package:elmanfy/core/errors/faliures.dart';

class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterSucsess extends RegisterState {}
class RegisterFailuer extends RegisterState {
  final Faliures faliures;

  RegisterFailuer({required this.faliures});
}
