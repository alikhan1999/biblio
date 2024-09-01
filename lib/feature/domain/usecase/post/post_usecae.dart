
import 'package:biblio_bazar/application/core/failure/failure.dart';
import 'package:biblio_bazar/application/core/usecases/usecase.dart';
import 'package:biblio_bazar/feature/data/models/items_model.dart';
import 'package:biblio_bazar/feature/domain/entities/post/post_enity.dart';
import 'package:biblio_bazar/feature/domain/interfaces/post/i_post_repo.dart';

import 'package:dartz/dartz.dart';

class GetProductItemUseCase implements UseCase<PostList, PostEntity> {
  GetProductItemUseCase(this.repository);
  final IPostRepo repository;

  @override
  Future<Either<Failure, PostList>> call(PostEntity params) async {
    return repository.getItems(params);
  }
}
