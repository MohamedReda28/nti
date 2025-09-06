import 'package:dio/dio.dart';

class Failur {
  final String errMassege;

  Failur({required this.errMassege});
}

class ServerFailure extends Failur {
  ServerFailure({required super.errMassege});

  factory ServerFailure.fromDioException(DioException dioException){


    switch(dioException.type)
    {

      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMassege: 'Connction time outTime with api');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMassege:'Send messege fail with api');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMassege:'Receive messege fail with api');
      case DioExceptionType.badCertificate:
        return ServerFailure(errMassege:'Bad certificate received');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode !,
            dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(errMassege:'the reust was cancelled ,please try again!');
      case DioExceptionType.connectionError:
        return ServerFailure(errMassege:'the internet connection fail,please try again!');
      case DioExceptionType.unknown:
        return ServerFailure(errMassege:'Unexpected error ,please try again!');
      default:
        return ServerFailure(errMassege:'Oops ther was an error ,please try again!');
    }
  }
  factory ServerFailure.fromResponse(int satatusCode,Map<String,dynamic> responsData)
  {
    if(satatusCode==400||satatusCode==401||satatusCode==403)
    {
      return ServerFailure(errMassege:responsData['error']['message']);
    }else if(satatusCode==404)
    {
      return ServerFailure(errMassege:'You requst not found,please try later!');
    }else if(satatusCode==500)
    {
      return ServerFailure(errMassege:'the Server has an error ,please try later!');
    }
    else {
      return ServerFailure(errMassege:'Unexpected error ,please try again!');
    }
  }


  

}
