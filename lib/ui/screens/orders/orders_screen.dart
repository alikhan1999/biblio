import 'package:biblio_bazar/all_utils.dart';
import 'package:biblio_bazar/providers/book_provider.dart';
import 'package:biblio_bazar/ui/screens/home/components/book_list_view.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/OrdersScreen';
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.whiteColor,
        foregroundColor: AppTheme.blackColor,
        title: const MyText(
          'Order received',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Consumer<BookProvider>(
        builder: (context, provider, child) =>
            BookListView(provider.booksOrders),
      ),
    );
  }
}
