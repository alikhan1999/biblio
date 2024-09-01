
import 'package:biblio_bazar/application/core/failure/failure.dart';
import 'package:biblio_bazar/feature/data/models/items_model.dart';
import 'package:biblio_bazar/feature/domain/entities/patient/patient_enity.dart';
import 'package:dartz/dartz.dart';


abstract class IItemRepo {
  Future<Either<Failure, ProductList>> getItems(ItemsEntity param);


}
