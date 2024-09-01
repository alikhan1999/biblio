import 'package:biblio_bazar/feature/di/di.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initMainServiceLocator() async {
  await setupLocator();
  return serviceLocator.allReady();
}
