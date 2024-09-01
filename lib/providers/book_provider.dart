import 'package:biblio_bazar/all_utils.dart';
import 'package:biblio_bazar/application/core/result.dart';
import 'package:biblio_bazar/common/logger/log.dart';
import 'package:biblio_bazar/feature/data/models/items_model.dart';
import 'package:biblio_bazar/feature/di/di.dart';
import 'package:biblio_bazar/feature/domain/entities/post/post_enity.dart';
import 'package:biblio_bazar/feature/domain/interfaces/post/i_post_repo.dart';
import 'package:biblio_bazar/feature/domain/usecase/post/post_usecae.dart';

import 'package:biblio_bazar/models/book.dart';

class BookProvider extends ChangeNotifier {
  double total = 0;
  double totalPrice = 0;
  late IPostRepo itemRepo;
  double totalDeliveryFee = 0;
  List<Book> allBooks = [];
  List<Book> wishList = [];
  List<Book> bookStore = [];
  List<Book> booksOrders = [];
  List<Book> booksInCart = [];
  List<Book> booksUploaded = [];
  List<Book> bookSellerList = [];
  List<Book> booksInMarketplace = [];

  BookProvider() {
    itemRepo = inject<IPostRepo>();
  }

  /// To fetch all books and populate in the app
  Future<bool> fetchAllBooks() async {
    final listOfBook = listOfBooks;
    final bookOfMarketplace = booksOfMarketplace;

    allBooks = [...listOfBook];

    booksInMarketplace = [...bookOfMarketplace];
    // filterBooks();
    return true;
  }

  Future<void> addBook(Book book) async {
    // await bookRepository.add(book);
    allBooks.add(book);
    booksUploaded.add(book);
    notifyListeners();
  }

  void filterBooks() {
    final user = Prefs.instance.user;
    if (user != null) {
      booksInMarketplace = [];
      booksUploaded = [];
      booksOrders = [];
      booksInCart = [];
      getFavorite();

      for (final book in allBooks) {
        // if (book.favorite == true) {
        //   wishList.add(book);
        // }
        if (book.seller.email == user.email) {
          booksUploaded.add(book);
          if (book.buyer != null) {
            booksOrders.add(book);
          }
        } else if (book.buyer?.email == user.email) {
          booksInCart.add(book);
        } else if (book.buyer == null) {
          booksInMarketplace.add(book);
        }
      }
    }
  }

  Future<bool> buyBook(Book book) async {
    final user = Prefs.instance.user;
    if (user != null) {
      booksInCart.add(book);

      /// remove duplication
      booksInCart = duplicateBook(booksInCart);

      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> removeBook(Book book) async {
    final user = Prefs.instance.user;
    if (user != null) {
      // await bookRepository.update(book.id, {'buyer': null});

      final index =
          booksInCart.indexWhere((element) => element.id.contains(book.id));
      booksInCart.removeAt(index);
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> deleteBook(Book book) async {
    final user = Prefs.instance.user;
    if (user != null) {
      // await bookRepository.delete(book.id);

      final index =
          booksInCart.indexWhere((element) => element.id.contains(book.id));
      booksInCart.removeAt(index);

      notifyListeners();
      return true;
    }
    return false;
  }

  void booksAmountCalculation(List<Book> myCartItems) {
    myCartItems.map((items) {
      totalDeliveryFee = double.parse(items.deliveryFee) + totalDeliveryFee;
      totalPrice = double.parse(items.price) + totalPrice;
    }).toList();
    total = totalPrice + totalDeliveryFee;
    notifyListeners();
  }

  void clearAmount() {
    totalPrice = 0;
    total = 0;
    totalDeliveryFee = 0;
  }

  bool isCheckSameSeller(Book book) {
    return booksInCart
        .any((element) => element.seller.email == book.seller.email);
  }

  void findBookSeller() {
    bookSellerList.addAll(allBooks);
    // remove same items from the list
    final ids = bookSellerList.map((e) => e.seller.email).toSet();
    bookSellerList.retainWhere((x) => ids.remove(x.seller.email));
  }

  List<Book> duplicateBook(List<Book> list) {
    final ids = list.map((e) => e.id).toSet();
    list.retainWhere((x) => ids.remove(x.id));
    return list;
  }

  void findBookStore(String bookStoreOwner) {
    bookStore.clear();
    for (final book in allBooks) {
      if (book.seller.email == bookStoreOwner) {
        bookStore.add(book);
      }
    }
  }

  List<Book> getFavorite() {
    wishList = Prefs.instance.getWishListItems();
    return wishList;
  }

  Future<bool> setFavorite(Book book) async {
    final user = Prefs.instance.user;
    if (user != null && book.favorite) {
      wishList.add(book);
      Prefs.instance.setWishlist(wishList);
      // await bookRepository.update(book.id, {'favorite': book.favorite});
      await fetchAllBooks();
      notifyListeners();
      return true;
    }
    Prefs.instance.removeFile(book.id);
    await fetchAllBooks();
    notifyListeners();
    return false;
  }

  Future<List<PostModel>?> getProductItem(PostEntity params , Result<PostList> result) async {
    PostList productList = PostList(<PostModel>[]);
    GetProductItemUseCase getProductItemUseCase =
        GetProductItemUseCase(itemRepo);
    final response = await getProductItemUseCase(params);
    response.fold((error) {
      d(error);
      result.onError(error);
    }, (response) {
      d(response);
      productList = response;

      notifyListeners();
      result.onSuccess(response);
      return productList.productList;
    });
    return productList.productList;
  }
}
