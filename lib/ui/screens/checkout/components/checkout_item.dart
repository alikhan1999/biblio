import 'package:biblio_bazar/all_utils.dart';
import 'package:biblio_bazar/providers/book_provider.dart';
import 'package:biblio_bazar/ui/screens/home/components/book_card.dart';

class CheckoutItem extends StatelessWidget {
  const CheckoutItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<BookProvider>();

    return ListView.separated(
      padding: const EdgeInsets.only(top: 20),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: provider.booksInCart.length,
      shrinkWrap: true,
      primary: true,
      itemBuilder: (context, index) {
        return
          BookCard(provider.booksInCart[index],isShowDetailPage:false );
      },
      separatorBuilder: (BuildContext context, int index) =>
      const SizedBox(height: 8),
    );
  }
}