import 'package:biblio_bazar/all_utils.dart';
import 'package:biblio_bazar/providers/book_provider.dart';
import 'package:biblio_bazar/ui/screens/home/components/book_list_view.dart';

class WishListScreen extends StatelessWidget {
  static const routeName = '/WishListScreen';
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.whiteColor,
        foregroundColor: AppTheme.blackColor,
        title: const MyText(
          'Wish List',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Consumer<BookProvider>(
        builder: (context, provider, child) =>
            BookListView(provider.wishList, wishButton: true),
      ),
    );
  }
}
