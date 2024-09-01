

import 'package:biblio_bazar/application/core/failure/failure.dart';
import 'package:biblio_bazar/application/network/error_handler/error_handler.dart';
import 'package:biblio_bazar/feature/data/models/items_model.dart';
import 'package:biblio_bazar/feature/data/remote_data/items/i_items_api.dart';
import 'package:biblio_bazar/feature/domain/entities/post/post_enity.dart';
import 'package:biblio_bazar/feature/domain/interfaces/post/i_post_repo.dart';

import 'package:dartz/dartz.dart';

class PostRepo implements IPostRepo {
  PostRepo({required this.api});
  IPostApi api;

  @override
  Future<Either<Failure, PostList>> getItems(PostEntity param) async {
    try {
      final result = await api.getItems(param);
      return Right(result);
    } catch (error) {
      return Left(getFailure(error as Exception));
    }
  }




}
