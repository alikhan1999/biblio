
import 'package:biblio_bazar/application/core/failure/failure.dart';
import 'package:biblio_bazar/feature/data/models/items_model.dart';
import 'package:biblio_bazar/feature/domain/entities/post/post_enity.dart';
import 'package:dartz/dartz.dart';


abstract class IPostRepo {
  Future<Either<Failure, PostList>> getItems(PostEntity param);


}
