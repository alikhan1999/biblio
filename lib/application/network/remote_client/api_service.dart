import 'dart:io';


import 'package:biblio_bazar/application/network/external_values/iExternalValue.dart';
import 'package:biblio_bazar/application/network/remote_client/iApService.dart';
import 'package:biblio_bazar/common/logger/log.dart';
import 'package:dio/dio.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

class ApiService extends Interceptor implements IApiService {
  ApiService.create({required IExternalValues externalValues}) {
    serviceGenerator(externalValues);
  }


  bool _isTokenRequired = false;

  @override
  Dio get() => _dio;

  @override
  BaseOptions getBaseOptions(IExternalValues externalValues) {
    return BaseOptions(
        baseUrl: externalValues.getBaseUrlv1(),
        receiveDataWhenStatusError: true,
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        connectTimeout:  60 * 1000,
        receiveTimeout: 60 * 1000);
  }

  @override
  HttpClient httpClientCreate(HttpClient client) {
    client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    return client;
  }

  @override
  void serviceGenerator(IExternalValues externalValues) {
    _dio = Dio(getBaseOptions(externalValues));
    _dio.interceptors.add(this);
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
    // (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = httpClientCreate;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    d("onRequest");
    d('path: ${options.path}');

    if (_isTokenRequired) {
      // IPrefHelper prefHelper = inject<IPrefHelper>();
      // String? token = prefHelper.retrieveToken();
      String? token = "token";
      options.headers.addAll({HttpHeaders.authorizationHeader: 'Bearer $token',

      });
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    d("onResponse");
    d('status code: ${response.statusCode}');

    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    d("onError");
    d('status code: ${err.response?.statusCode}');
    return handler.next(err);
  }

  late Dio _dio;

  @override
  void setIsTokenRequired(bool value) {
    _isTokenRequired = value;
  }
}
