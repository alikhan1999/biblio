
import 'package:biblio_bazar/application/network/external_values/iExternalValue.dart';

class ExternalValues implements IExternalValues {
  @override
  String getBaseUrlv1() {
    return 'http://jsonplaceholder.typicode.com';
  }

  @override
  String countriesBaseUrl() {
    return "https://countriesnow.space";
  }

  @override
  String getBaseUrl() {
    return 'http://jsonplaceholder.typicode.com';
  }
}
