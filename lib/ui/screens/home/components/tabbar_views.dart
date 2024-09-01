import 'package:biblio_bazar/all_utils.dart';
import 'package:biblio_bazar/models/book.dart';
import 'package:biblio_bazar/providers/book_provider.dart';
import 'package:biblio_bazar/ui/screens/home/components/book_list_view.dart';
import 'package:biblio_bazar/ui/screens/home/components/book_store_listview.dart';

class TabBarViews extends StatefulWidget {
  final List<Book> books;
  final bool deleteButton;

  const TabBarViews({super.key, required this.books, this.deleteButton = false});

  @override
  State<TabBarViews> createState() => _TabBarViewsState();
}

class _TabBarViewsState extends State<TabBarViews> {

  @override
  Widget build(BuildContext context) {
    final provider=context.read<BookProvider>();
    return DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.book_outlined, color: AppTheme.blueColor)),
                Tab(
                    icon: Icon(Icons.store_mall_directory_outlined,
                        color: AppTheme.blueColor))
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  BookListView(widget.books, wishButton: true),
                  BookStoreListView(provider.bookSellerList),
                ],
              ),
            ),
          ],
        ));
  }
}