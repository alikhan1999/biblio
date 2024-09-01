import 'package:biblio_bazar/all_utils.dart';
import 'package:biblio_bazar/models/book.dart';
import 'package:biblio_bazar/models/enums/book_category.dart';
import 'package:biblio_bazar/models/enums/book_condition.dart';
import 'package:biblio_bazar/providers/book_provider.dart';
import 'package:biblio_bazar/ui/screens/book_details/book_details_screen.dart';
import 'package:biblio_bazar/ui/screens/home/components/book_image.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final bool deleteButton;
  final bool wishButton;
  final bool isShowDetailPage;

   const BookCard(this.book, {Key? key, this.deleteButton = false, this.isShowDetailPage = true,  this.wishButton = false})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MyCard(
      child: InkWell(
        onTap: () => isShowDetailPage ? context.push(BookDetailsScreen.routeName, extra: book):0,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              BookImage(book.imagePath, height: 100),
              const HorizontalSpacing(24),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          book.title,
                          color: AppTheme.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        const HorizontalSpacing(20),
                        deleteButton
                            ? IconButton(
                                visualDensity: const VisualDensity(
                                    horizontal: -4, vertical: -4),
                                padding: EdgeInsets.zero,
                                onPressed:()=> removeBook(context),
                                icon: const Icon(Icons.delete_forever_outlined,
                                    size: 17))
                            : kEmptyWidget ,
                        wishButton ?favoriteWidget(context, book):kEmptyWidget
                      ],
                    ),
                    const VerticalSpacing(6),
                    MyText(book.author, color: AppTheme.darkGreyColor),
                    const VerticalSpacing(6),
                    MyText(book.category.value, color: AppTheme.darkGreyColor),
                    const VerticalSpacing(12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText('Rs.${book.price}', color: AppTheme.blackColor),
                        book.condition.card,
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget favoriteWidget(BuildContext context, Book book){
    final  provider= context.read<BookProvider>();
    final wishList=provider.getFavorite();
    final itemExist= wishList.any((element) => element.id.contains(book.id));
    return  IconButton(
        visualDensity: const VisualDensity(
            horizontal: -4, vertical: -4),
        padding: EdgeInsets.zero,
        onPressed:()=> setFavorite(context),
        icon:  Icon( itemExist
            ?Icons.favorite :Icons.favorite_border ,
            size: 17, color: itemExist
              ?AppTheme.yellowColor:Colors.grey));


  }

  void setFavorite(BuildContext context)async{
  final  provider= context.read<BookProvider>();
  final wishList=provider.getFavorite();
 final itemExist= wishList.any((element) => element.id.contains(book.id));
    EasyLoading.show();
    itemExist ? book.favorite= false:  book.favorite= true;
    // book.favorite = !book.favorite;
    final isBookRemoved = await provider.setFavorite(book);
    EasyLoading.dismiss();

    if (isBookRemoved) {
      EasyLoading.showSuccess('Add your Wish List!');
    } else {
      EasyLoading.showSuccess('Removed Book Successfully');

    }
  }
  void removeBook(BuildContext context) async {
    EasyLoading.show();
    final isBookRemoved = await context.read<BookProvider>().removeBook(book);
    EasyLoading.dismiss();

    if (isBookRemoved) {
      EasyLoading.showSuccess('Book removed from your cart!');
    } else {
      EasyLoading.showError('Error: Book could not be removed');
    }
  }
}
