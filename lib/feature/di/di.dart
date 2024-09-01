import 'package:biblio_bazar/application/network/external_values/ExternalValues.dart';
import 'package:biblio_bazar/application/network/remote_client/api_service.dart';
import 'package:biblio_bazar/application/network/remote_client/iApService.dart';
import 'package:biblio_bazar/feature/data/remote_data/items/i_items_api.dart';
import 'package:biblio_bazar/feature/data/remote_data/items/items_api.dart';
import 'package:biblio_bazar/feature/data/repo/items/items_repo.dart';
import 'package:biblio_bazar/feature/domain/interfaces/items/i_items_repo.dart';
import 'package:get_it/get_it.dart';

final inject = GetIt.instance;
Future<void> setupLocator() async {
  // initialized Api services
  inject.registerLazySingleton<IApiService>(
      () => ApiService.create(externalValues: ExternalValues()));

// initialized product items service
  inject.registerLazySingleton<IItemsApi>(() => ItemsApi(inject()));
  inject.registerLazySingleton<IItemRepo>(() => ItemRepo(api: inject()));
}
