import 'package:biblio_bazar/all_utils.dart';
import 'package:biblio_bazar/models/book.dart';
import 'package:biblio_bazar/providers/book_provider.dart';
import 'package:biblio_bazar/ui/common_widgets/person_image_name.dart';
import 'package:biblio_bazar/ui/screens/book_details/components/title_value_text.dart';
import 'package:biblio_bazar/ui/screens/home/components/book_list_view.dart';

class StoreDetailsScreen extends StatelessWidget {
  static const routeName = '/StoreDetailsScreen';

  final Book? book;

  const StoreDetailsScreen(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<BookProvider>();
    return BaseScaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.whiteColor,
        foregroundColor: AppTheme.blackColor,
        title: const MyText(
          'Store Details',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: book == null
          ? const Center(child: MyText('No Details found'))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                book!.seller.email == Prefs.instance.user?.email
                    ? kEmptyWidget
                    : Padding(
                        padding:
                            const EdgeInsets.only(top: 12, left: 14, right: 14),
                        child: MyCard(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              const MyText(
                                'Seller',
                                color: AppTheme.blueColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              const VerticalSpacing(12),
                              PersonImageName(
                                imagePath: book!.seller.imagePath,
                                name: book!.seller.name,
                              ),
                              const VerticalSpacing(12),
                              Row(
                                children: [
                                  Expanded(
                                    child: TitleValueText(
                                      title: 'Store Name',
                                      value: book!.seller.storeName ?? '-',
                                      titleFontSize: 10,
                                      valueFontSize: 12,
                                    ),
                                  ),
                                  Expanded(
                                    child: TitleValueText(
                                      title: 'Store Address',
                                      value: book!.seller.storeAddress ?? '-',
                                      titleFontSize: 10,
                                      valueFontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const VerticalSpacing(10),
                              Row(
                                children: [
                                  Expanded(
                                    child: TitleValueText(
                                      title: 'Email',
                                      value: book!.seller.email,
                                      titleFontSize: 10,
                                      valueFontSize: 12,
                                    ),
                                  ),
                                  Expanded(
                                    child: TitleValueText(
                                      title: 'Phone',
                                      value: book!.seller.phone,
                                      titleFontSize: 10,
                                      valueFontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                Expanded(
                    child:
                        BookListView(provider.bookStore, showSearchBar: true)),
              ],
            ),
    );
  }

  void buyBook(BuildContext context) async {
    EasyLoading.show();
    final isBookAdded = await context.read<BookProvider>().buyBook(book!);
    EasyLoading.dismiss();

    if (isBookAdded) {
      Navigator.pop(context);
      EasyLoading.showSuccess('Book added to your cart!');
    } else {
      EasyLoading.showError('Error: Book could not be added');
    }
  }

  void removeBook(BuildContext context) async {
    EasyLoading.show();
    final isBookRemoved = await context.read<BookProvider>().removeBook(book!);
    EasyLoading.dismiss();

    if (isBookRemoved) {
      Navigator.pop(context);
      EasyLoading.showSuccess('Book removed from your cart!');
    } else {
      EasyLoading.showError('Error: Book could not be removed');
    }
  }

  void deleteBook(BuildContext context) async {
    EasyLoading.show();
    final isBookDeleted = await context.read<BookProvider>().deleteBook(book!);
    EasyLoading.dismiss();

    if (isBookDeleted) {
      Navigator.pop(context);
      EasyLoading.showSuccess('Book deleted!');
    } else {
      EasyLoading.showError('Error: Book could not be deleted');
    }
  }
}
