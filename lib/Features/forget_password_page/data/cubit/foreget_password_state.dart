import 'package:elmanfy/core/errors/faliures.dart';

class ForegetPasswordState {}

class ForegetPasswordInitial extends ForegetPasswordState {}
class ForegetPasswordLoading extends ForegetPasswordState {}
class ForegetPasswordSucsess extends ForegetPasswordState {}
class ForegetPasswordFaliure extends ForegetPasswordState {
  final Faliures faliures;

  ForegetPasswordFaliure({required this.faliures});

}
