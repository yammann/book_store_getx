import 'package:dio/dio.dart';

abstract class Failur {
  String errorMesage;

  Failur(this.errorMesage);
}

class ServerFailur extends Failur {
  ServerFailur(String errorMessage) : super(errorMessage);

  factory ServerFailur.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailur("Connection timeout with ApiServer");
      case DioExceptionType.sendTimeout:
        return ServerFailur("Send timeout with ApiServer");
      case DioExceptionType.receiveTimeout:
        return ServerFailur("Receive timeout with ApiServer");
      case DioExceptionType.badCertificate:
        return ServerFailur("Bad Certificate");
      case DioExceptionType.badResponse:
        return ServerFailur.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data!);
      case DioExceptionType.cancel:
        return ServerFailur("Request to API server was canceled");
      case DioExceptionType.connectionError:
        return ServerFailur("No internet connection");
      case DioExceptionType.unknown:
        return ServerFailur("Unexpected error");
      default:
        return ServerFailur("Oops, there was an error. Please try again");
    }
  }

  factory ServerFailur.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailur(response["error"]["message"]);
    } else if (statusCode == 404) {
      return ServerFailur("Your request not found. Please try later!");
    } else if (statusCode == 500) {
      return ServerFailur("Internal server error. Please try later!");
    } else {
      return ServerFailur("Oops, there was an error. Please try again");
    }
  }
}
