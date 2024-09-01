import 'package:biblio_bazar/all_utils.dart';
import 'package:biblio_bazar/models/book.dart';
import 'package:biblio_bazar/ui/common_widgets/search_bar.dart';
import 'package:biblio_bazar/ui/screens/home/components/bool_store_card.dart';

class BookStoreListView extends StatefulWidget {
  final List<Book> books;
  final bool deleteButton;

  const BookStoreListView(this.books, {Key? key, this.deleteButton = false})
      : super(key: key);

  @override
  State<BookStoreListView> createState() => _BookStoreListViewState();
}

class _BookStoreListViewState extends State<BookStoreListView> {
  List<Book> filteredBooks = [];

  @override
  void initState() {
    super.initState();
    filteredBooks = widget.books;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          // SearchBar(hintText: 'Search book title', onChanged: searchBook),
          const VerticalSpacing(12),
          Expanded(
            child: filteredBooks.isEmpty
                ? const Center(child: MyText('No books available'))
                : ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        BookStoreCard(book: filteredBooks[index]),
                    separatorBuilder: (context, index) =>
                        const VerticalSpacing(12),
                    itemCount: filteredBooks.length,
                  ),
          ),
        ],
      ),
    );
  }

  void searchBook(String keyword) {
    List<Book> list = [];
    for (final item in widget.books) {
      if (item.title.toLowerCase().contains(keyword.toLowerCase())) {
        list.add(item);
      }
    }
    setState(() => filteredBooks = list);
  }
}
