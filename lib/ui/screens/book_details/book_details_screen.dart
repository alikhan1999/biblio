import 'package:biblio_bazar/all_utils.dart';
import 'package:biblio_bazar/models/book.dart';
import 'package:biblio_bazar/models/enums/book_category.dart';
import 'package:biblio_bazar/models/enums/book_condition.dart';
import 'package:biblio_bazar/providers/book_provider.dart';
import 'package:biblio_bazar/ui/common_widgets/person_image_name.dart';
import 'package:biblio_bazar/ui/screens/book_details/components/title_value_text.dart';
import 'package:biblio_bazar/ui/screens/home/components/book_image.dart';

class BookDetailsScreen extends StatelessWidget {
  static const routeName = '/BookDetailsScreen';

  final Book? book;
  const BookDetailsScreen(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    final inCart = book?.buyer?.email == Prefs.instance.user?.email;

    return BaseScaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.whiteColor,
        foregroundColor: AppTheme.blackColor,
        title: const MyText(
          'Book Details',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: book == null
          ? const Center(child: MyText('No book details found'))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BookImage(
                    book!.imagePath,
                    height: 250,
                    width: double.infinity,
                  ),
                  const VerticalSpacing(36),
                  TitleValueText(
                    title: 'Title',
                    value: book!.title,
                    valueFontSize: 18,
                    valueFontWeight: FontWeight.w600,
                  ),
                  const VerticalSpacing(12),
                  TitleValueText(
                    title: 'Author',
                    value: book!.author,
                    valueFontSize: 18,
                  ),
                  const VerticalSpacing(12),
                  Row(
                    children: [
                      Expanded(
                        child: TitleValueText(
                          title: 'Category',
                          value: book!.category.value,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const MyText(
                              'Condition',
                              color: AppTheme.darkGreyColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            const VerticalSpacing(6),
                            book!.condition.card,
                          ],
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpacing(12),
                  Row(
                    children: [
                      Expanded(
                        child: TitleValueText(title: 'ISBN', value: book!.isbn),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const MyText(
                              'Hard cover',
                              color: AppTheme.darkGreyColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            const VerticalSpacing(6),
                            Icon(
                              book!.hasHardCover
                                  ? Icons.check_circle_outline
                                  : Icons.do_not_disturb_on_outlined,
                              color: book!.hasHardCover
                                  ? Colors.green.shade700
                                  : AppTheme.darkGreyColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpacing(12),
                  Row(
                    children: [
                      Expanded(
                        child: TitleValueText(
                          title: 'Price',
                          value: 'Rs. ${book!.price}',
                        ),
                      ),
                      Expanded(
                        child: TitleValueText(
                          title: 'Delivery fee',
                          value: 'Rs. ${book!.deliveryFee}',
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpacing(12),
                  TitleValueText(
                    title: 'Description',
                    value: book!.description,
                    valueFontSize: 16,
                  ),
                  book!.seller.email == Prefs.instance.user?.email
                      ? kEmptyWidget
                      : Padding(
                          padding: const EdgeInsets.only(top: 12),
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
                  book!.buyer != null &&
                          book!.seller.email == Prefs.instance.user?.email
                      ? Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: MyCard(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                const MyText(
                                  'Buyer',
                                  color: AppTheme.blueColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                const VerticalSpacing(12),
                                PersonImageName(
                                  imagePath: book!.buyer!.imagePath,
                                  name: book!.buyer!.name,
                                ),
                                const VerticalSpacing(12),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TitleValueText(
                                        title: 'Email',
                                        value: book!.buyer!.email,
                                        titleFontSize: 10,
                                        valueFontSize: 12,
                                      ),
                                    ),
                                    Expanded(
                                      child: TitleValueText(
                                        title: 'Phone',
                                        value: book!.buyer!.phone,
                                        titleFontSize: 10,
                                        valueFontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : kEmptyWidget,
                ],
              ),
            ),
      bottom: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: AppTheme.whiteColor,
            border: Border(top: BorderSide(color: AppTheme.lightPurpleColor)),
          ),
          child: book?.seller.email == Prefs.instance.user?.email
              ? MyElevatedButton(
                  onTap: () => deleteBook(context),
                  label: 'Delete book',
                  icon: Icons.delete_outline,
                  buttonColor: AppTheme.redColor,
                  labelColor: AppTheme.blackColor,
                )
              : MyElevatedButton(
                  onTap: () => inCart ? removeBook(context) : buyBook(context),
                  label: inCart ? 'Remove from cart' : 'Add to cart',
                  icon: inCart
                      ? Icons.remove_shopping_cart_outlined
                      : Icons.add_shopping_cart_outlined,
                  buttonColor: inCart ? AppTheme.redColor : AppTheme.blueColor,
                  labelColor:
                      inCart ? AppTheme.blackColor : AppTheme.whiteColor,
                ),
        ),
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
