
import 'package:biblio_bazar/application/core/exception/exception.dart';
import 'package:biblio_bazar/application/network/error_handler/error_handler.dart';
import 'package:biblio_bazar/application/network/remote_client/iApService.dart';
import 'package:biblio_bazar/feature/data/models/items_model.dart';
import 'package:biblio_bazar/feature/data/remote_data/items/i_items_api.dart';
import 'package:biblio_bazar/feature/domain/entities/patient/patient_enity.dart';
import 'package:dio/dio.dart';



class ItemsApi implements IItemsApi {
  ItemsApi(IApiService api) {
    api.setIsTokenRequired(false);
    _dio = api.get();
  }

  @override
  Future<ProductList> getItems(ItemsEntity param) async {
    try {
      final res = await _dio.get('/photos?_start=${param.start}&_limit=${param.limit}');

      return  ProductList.fromJson(res.data);
    } on DioError catch (e) {
      final exception = getException(e);
      throw exception;
    } catch (e) {
      throw ResponseException(msg: e.toString());
    }
  }

  late Dio _dio;
}
