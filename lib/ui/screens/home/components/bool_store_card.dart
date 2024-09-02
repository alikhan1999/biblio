import 'package:biblio_bazar/all_utils.dart';
import 'package:biblio_bazar/models/book.dart';
import 'package:biblio_bazar/providers/book_provider.dart';
import 'package:biblio_bazar/ui/common_widgets/person_image_name.dart';
import 'package:biblio_bazar/ui/screens/book_details/components/title_value_text.dart';
import 'package:biblio_bazar/ui/screens/store_details/store_details_screen.dart';

class BookStoreCard extends StatelessWidget {
  final Book book;

  const BookStoreCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return MyCard(
      child: InkWell(
        onTap: () {
          context.read<BookProvider>().findBookStore(book.seller.email);
          context.push(StoreDetailsScreen.routeName, extra: book);
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: MyText(
                  book.seller.storeName ?? '-',
                  color: AppTheme.blueColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const VerticalSpacing(8),
              PersonImageName(
                imagePath: book.seller.imagePath,
                name: book.seller.name,
              ),
              const VerticalSpacing(8),
              TitleValueText(
                title: 'Store address',
                value: book.seller.storeAddress ?? '-',
                titleFontSize: 10,
                valueFontSize: 12,
              ),
              const VerticalSpacing(10),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TitleValueText(
                      title: 'Email',
                      value: book.seller.email,
                      titleFontSize: 10,
                      valueFontSize: 12,
                    ),
                  ),
                  Expanded(
                    child: TitleValueText(
                      title: 'Phone',
                      value: book.seller.phone,
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
    );
  }
}
