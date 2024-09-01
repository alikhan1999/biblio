import 'package:biblio_bazar/all_utils.dart';
import 'package:biblio_bazar/providers/book_provider.dart';
import 'package:biblio_bazar/ui/screens/add_book/add_book_screen.dart';
import 'package:biblio_bazar/ui/screens/home/components/book_list_view.dart';

class UploadedBooksScreen extends StatelessWidget {
  static const routeName = '/UploadedBooksScreen';
  const UploadedBooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.whiteColor,
        foregroundColor: AppTheme.blackColor,
        title: const MyText(
          'Uploaded books',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Consumer<BookProvider>(
        builder: (context, provider, child) =>
            BookListView(provider.booksUploaded),
      ),
      fab: MyElevatedButton(
        onTap: () => context.push(AddBookScreen.routeName),
        label: 'Add book',
        icon: Icons.add,
        buttonColor: AppTheme.yellowColor,
        labelColor: AppTheme.blackColor,
        radius: 20,
        isExpanded: false,
      ),
    );
  }
}
