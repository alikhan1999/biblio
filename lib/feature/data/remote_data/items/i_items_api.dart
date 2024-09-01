

import 'package:biblio_bazar/feature/data/models/items_model.dart';
import 'package:biblio_bazar/feature/domain/entities/patient/patient_enity.dart';

abstract class IItemsApi {
  Future<ProductList> getItems(ItemsEntity param);
}
