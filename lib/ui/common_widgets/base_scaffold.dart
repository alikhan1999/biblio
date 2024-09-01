import 'package:biblio_bazar/all_utils.dart';

class BaseScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget body;
  final Widget? bottom;
  final Widget? fab;

  const BaseScaffold({
    required this.body,
    this.appBar,
    this.drawer,
    this.bottom,
    this.fab,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      body: GestureDetector(
        onTap: () {
          final FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
        },
        child: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            color: AppTheme.whiteColor,
            image: DecorationImage(
              image: AssetImage(kImageBackground),
              fit: BoxFit.cover,
            ),
          ),
          child: body,
        ),
      ),
      floatingActionButton: fab,
      bottomNavigationBar: bottom,
    );
  }
}
