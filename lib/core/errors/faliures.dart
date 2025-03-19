class Faliures {
  final String errMessage;

  Faliures({required this.errMessage});
}
class ServerError extends Faliures{
  ServerError({required super.errMessage});

}
class NetWorkError extends Faliures{
  NetWorkError({required super.errMessage});

}