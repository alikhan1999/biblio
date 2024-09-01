import 'package:biblio_bazar/all_utils.dart';
import 'package:biblio_bazar/models/book.dart';
import 'package:biblio_bazar/ui/common_widgets/search_bar.dart';
import 'package:biblio_bazar/ui/screens/home/components/book_card.dart';

class BookListView extends StatefulWidget {
  final List<Book> books;
  final bool deleteButton;
  final bool wishButton;
  final bool showSearchBar;
  const BookListView(this.books, {super.key,  this.deleteButton = false,  this.showSearchBar= false,  this.wishButton = false});

  @override
  State<BookListView> createState() => _BookListViewState();
}

class _BookListViewState extends State<BookListView> {
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
          // widget.showSearchBar? kEmptyWidget: SearchBar(hintText: 'Search book title', onChanged: searchBook) ,
          const VerticalSpacing(12),
          Expanded(
            child: filteredBooks.isEmpty
                ? const Center(child: MyText('No books available'))
                : ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        BookCard(filteredBooks[index], deleteButton: widget.deleteButton, wishButton: widget.wishButton),
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
