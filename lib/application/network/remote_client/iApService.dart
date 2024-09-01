import 'dart:io';

import 'package:biblio_bazar/application/network/external_values/iExternalValue.dart';
import 'package:dio/dio.dart';

abstract class IApiService {
  Dio get();
  void serviceGenerator(IExternalValues externalValues);
  BaseOptions getBaseOptions(IExternalValues externalValues);
  HttpClient httpClientCreate(HttpClient client);
  void setIsTokenRequired(bool value);
}
