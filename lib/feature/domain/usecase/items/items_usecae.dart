
import 'package:biblio_bazar/application/core/failure/failure.dart';
import 'package:biblio_bazar/application/core/usecases/usecase.dart';
import 'package:biblio_bazar/feature/data/models/items_model.dart';
import 'package:biblio_bazar/feature/domain/entities/patient/patient_enity.dart';
import 'package:biblio_bazar/feature/domain/interfaces/items/i_items_repo.dart';
import 'package:dartz/dartz.dart';

class GetProductItemUseCase implements UseCase<ProductList, ItemsEntity> {
  GetProductItemUseCase(this.repository);
  final IItemRepo repository;

  @override
  Future<Either<Failure, ProductList>> call(ItemsEntity params) async {
    return repository.getItems(params);
  }
}
