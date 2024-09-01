import 'package:biblio_bazar/all_utils.dart';
import 'package:biblio_bazar/providers/book_provider.dart';
import 'package:biblio_bazar/utils/router.dart';
import 'package:flutter/services.dart';
import 'package:biblio_bazar/application/main_config/main_config.dart' as config;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Prefs.instance.init();
  // await Firebase.initializeApp();
  await config.initMainServiceLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Biblio Bazaar',
      themeMode: ThemeMode.light,
      theme: AppTheme.buildTheme(),
      debugShowCheckedModeBanner: false,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      builder: EasyLoading.init(
        builder: (context, child) => MultiProvider(
          providers: [
            ListenableProvider(create: (_) => BookProvider()),
          ],
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child ?? kEmptyWidget,
          ),
        ),
      ),
    );
  }
}
