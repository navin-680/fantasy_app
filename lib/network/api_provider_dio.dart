// ignore_for_file: constant_identifier_names
import 'package:dio/dio.dart';
import '../utils/logger_application.dart';
import 'auth_interceptor.dart';
import 'network_response.dart';

enum RequestType { GET, POST, PUT, PATCH, DELETE }

class Api {
  String? service;
  bool? isAuthRequired;
  final bool showErrorPage;

  Api(this.service, {this.isAuthRequired = true, this.showErrorPage = true});

  late var dio = getDioInstance(showErrorPage);

  Future<NetworkResponse?> apiCall(String url, Map<String, dynamic>? queryParameters, dynamic body, RequestType requestType, {bool? storeData = false, Function(int, int)? sendProgress}) async {
    late Response result;
    try {
      switch (requestType) {
        case RequestType.GET:
          {
            Options options = Options(headers: header);
            result = await dio.get(url, queryParameters: queryParameters, options: options);
            break;
          }
        case RequestType.POST:
          {
            if (url.contains("file-uploader")) {
              header.update('Content-type', (value) => 'multipart/form-data');
              Options options = Options(headers: header);
              result = await dio.post(url, data: body, options: options, onSendProgress: sendProgress);
            } else {
              header.update('Content-type', (value) => 'application/json');
              Options options = Options(headers: header);
              result = await dio.post(url, data: body, options: options);
            }

            break;
          }
        case RequestType.DELETE:
          {
            Options options = Options(headers: header);
            result = await dio.delete(url, data: queryParameters, options: options);
            break;
          }
        case RequestType.PUT:
          // Handle this case.
          break;
        case RequestType.PATCH:
          //  Handle this case.
          break;
      }
      return NetworkResponse.success(result.data);
    } on DioError catch (error) {
      return NetworkResponse.error(error.response.toString());
    } catch (error) {
      return NetworkResponse.error(error.toString());
    }
  }

  Dio getDioInstance(bool showErrorPage) {
   return  getDio(showErrorPage);
  }
}

class ErrorInterceptors extends Interceptor {
  final Dio dio;
  final bool showErrorPage;

  ErrorInterceptors(this.dio, {this.showErrorPage = true});

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioErrorType.connectionError:
      case DioErrorType.badCertificate:
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw TimeOutException(err);
      case DioErrorType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err);
          case 401:
            throw UnauthorizedException(err);
          case 404:
            throw NotFoundException(err);
          case 409:
            throw ConflictException(err);
          case 413:
            throw OutOfSizeException(err);
          case 500:
            if (showErrorPage) {
            }
            throw InternalServerErrorException(err);
        }
        switch (err.error) {
          case "XMLHttpRequest error.":
            throw OutOfSizeException(err);
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.unknown:
        throw NoInternetConnectionException(err);
    }

    return handler.next(err);
  }
}

class BadRequestException extends DioError {
  BadRequestException(DioError r) : super(response: r.response, requestOptions: r.requestOptions);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class OutOfSizeException extends DioError {
  OutOfSizeException(DioError r) : super(response: Response(requestOptions: r.requestOptions, data: "File size must be less than 10 Mb"), requestOptions: r.requestOptions);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(DioError r) : super(response: r.response, requestOptions: r.requestOptions);

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends DioError {
  ConflictException(DioError r) : super(response: r.response, requestOptions: r.requestOptions);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioError {
  UnauthorizedException(DioError r) : super(response: r.response, requestOptions: r.requestOptions);

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends DioError {
  NotFoundException(DioError r) : super(response: r.response, requestOptions: r.requestOptions);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(DioError r) : super(response: r.response, requestOptions: r.requestOptions);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class TimeOutException extends DioError {
  TimeOutException(DioError r) : super(response: r.response, requestOptions: r.requestOptions);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}

class Logging extends Interceptor {
  final Dio dio;

  Logging(this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    ApplicationLogger.getLogger("Api request type").i(options.method);
    ApplicationLogger.getLogger("Api request url").i(options.baseUrl + options.path);
    ApplicationLogger.getLogger("Api request headers").i(options.headers);
    ApplicationLogger.getLogger("Api request body").i(options.data ?? "");
    ApplicationLogger.getLogger("Api request queryParams").i(options.queryParameters);
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    ApplicationLogger.getLogger("Response status code ${response.requestOptions.path}:").i(response.statusCode.toString());
    ApplicationLogger.getLogger("data ${response.requestOptions.path}:").i(response.data.toString());
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    ApplicationLogger.getLogger("status code ${err.requestOptions.path}: ${err.error}").e(err.type.toString());
    ApplicationLogger.getLogger("error ${err.requestOptions.path}").e(err.response.toString());
    return super.onError(err, handler);
  }
}

Map<String, String> header = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
};

Dio getDio(bool showErrorPage) {
  var dio = Dio(BaseOptions(
    baseUrl:"",
    receiveTimeout: const Duration(seconds: 20), // 20 seconds
    sendTimeout: const Duration(seconds: 20),
  ));

  dio.interceptors.addAll({
    //AuthorizationInterceptor(tokenRepository: TokenRepository()),
  });
  dio.interceptors.addAll({
    Logging(dio),
  });
  dio.interceptors.addAll({
    ErrorInterceptors(dio, showErrorPage: showErrorPage),
  });

  return dio;
}



