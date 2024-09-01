

import 'package:biblio_bazar/feature/data/models/items_model.dart';
import 'package:biblio_bazar/feature/domain/entities/post/post_enity.dart';

abstract class IPostApi {
  Future<PostList> getItems(PostEntity param);
}
