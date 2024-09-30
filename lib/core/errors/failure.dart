import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class Faliure {
  final String errorMessage;

  Faliure({required this.errorMessage});
}

class ServerFaliure extends Faliure {
  ServerFaliure({required super.errorMessage});
  factory ServerFaliure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFaliure(
            errorMessage: 'Connection timeout with api server');
      case DioExceptionType.sendTimeout:
        return ServerFaliure(errorMessage: 'Send timeout with api server');
      case DioExceptionType.receiveTimeout:
        return ServerFaliure(errorMessage: 'Receive timeout with api server');
      case DioExceptionType.badCertificate:
        return ServerFaliure(errorMessage: 'bad Certificate with api server');

      case DioExceptionType.badResponse:
        return ServerFaliure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFaliure(errorMessage: 'cancel with api server');

      case DioExceptionType.connectionError:
        return ServerFaliure(errorMessage: 'connectionError with api server');

      case DioExceptionType.unknown:
        if (dioException.message != null
            ? dioException.message!.contains('SocketException')
            : false) {
          return ServerFaliure(errorMessage: 'No Internet Connection');
        }
        return ServerFaliure(errorMessage: 'unexpected Error ,try again');
      default:
        return ServerFaliure(errorMessage: 'unexpected Error ,try again');
    }
  }
  factory ServerFaliure.fromResponse(int statusCode, dynamic resposne) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      try {
      return ServerFaliure(errorMessage: resposne['error']['message']);        
      } catch (e) {
        debugPrint('e: ${e.toString()}');        
      return ServerFaliure(errorMessage: 'Error happened , please try again!');
      }
    } else if (statusCode == 404) {
      return ServerFaliure(errorMessage: "request not found");
    } else if (statusCode == 500) {
      return ServerFaliure(
          errorMessage: "internal Server Error, please try again later !");
    } else {
      return ServerFaliure(
          errorMessage: "Oops there was an error, please try again later !");
    }
  }
}
/*
import 'package:dio/dio.dart';

abstract class Faliure {
  final String errorMessage;

  Faliure({required this.errorMessage});
}

class ServerFaliure extends Faliure {
  ServerFaliure({required super.errorMessage});

  factory ServerFaliure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFaliure(
            errorMessage: 'Connection timeout with api server');
      case DioExceptionType.sendTimeout:
        return ServerFaliure(errorMessage: 'Send timeout with api server');
      case DioExceptionType.receiveTimeout:
        return ServerFaliure(errorMessage: 'Receive timeout with api server');
      case DioExceptionType.badCertificate:
        return ServerFaliure(errorMessage: 'bad Certificate with api server');
      case DioExceptionType.badResponse:
        if (dioException.response != null && dioException.response!.statusCode != null) {
          return ServerFaliure.fromResponse(
              dioException.response!.statusCode!, dioException.response!.data);
        }
        return ServerFaliure(errorMessage: 'Bad response from server');
      case DioExceptionType.cancel:
        return ServerFaliure(errorMessage: 'Request to api server was canceled');
      case DioExceptionType.connectionError:
        return ServerFaliure(errorMessage: 'Connection error with api server');
      case DioExceptionType.unknown:
        if (dioException.message != null && dioException.message!.contains('SocketException')) {
          return ServerFaliure(errorMessage: 'No Internet Connection');
        }
        return ServerFaliure(errorMessage: 'Unexpected Error, try again');
      default:
        return ServerFaliure(errorMessage: 'Unexpected Error, try again');
    }
  }

  factory ServerFaliure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFaliure(errorMessage: response['error']?['message'] ?? "Unauthorized request");
    } else if (statusCode == 404) {
      return ServerFaliure(errorMessage: "Request not found");
    } else if (statusCode == 500) {
      return ServerFaliure(
          errorMessage: "Internal Server Error, please try again later!");
    } else {
      return ServerFaliure(
          errorMessage: "Oops there was an error, please try again later!");
    }
  }
}
*/