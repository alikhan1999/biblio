

import 'package:biblio_bazar/application/core/failure/failure.dart';
import 'package:biblio_bazar/application/network/error_handler/error_handler.dart';
import 'package:biblio_bazar/feature/data/models/items_model.dart';
import 'package:biblio_bazar/feature/data/remote_data/items/i_items_api.dart';
import 'package:biblio_bazar/feature/domain/entities/patient/patient_enity.dart';
import 'package:biblio_bazar/feature/domain/interfaces/items/i_items_repo.dart';
import 'package:dartz/dartz.dart';

class ItemRepo implements IItemRepo {
  ItemRepo({required this.api});
  IItemsApi api;

  @override
  Future<Either<Failure, ProductList>> getItems(ItemsEntity param) async {
    try {
      final result = await api.getItems(param);
      return Right(result);
    } catch (error) {
      return Left(getFailure(error as Exception));
    }
  }




}
