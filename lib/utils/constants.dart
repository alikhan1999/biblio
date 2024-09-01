import 'package:biblio_bazar/models/book.dart';
import 'package:biblio_bazar/models/enums/book_category.dart';
import 'package:biblio_bazar/models/enums/book_condition.dart';
import 'package:biblio_bazar/models/local_user.dart';

import 'package:flutter/material.dart';

/// Image Paths
const kImagesAssetsPath = 'assets/images';
const kImageBackground = '$kImagesAssetsPath/background.png';
const kImageLogo = '$kImagesAssetsPath/logo.jpg';
const kImageLogoWithText = '$kImagesAssetsPath/logo_with_text.jpg';

/// Sizes
const double kDefaultRadius = 8;

/// Widgets & Functions
const kEmptyWidget = SizedBox.shrink();

void dismissKeyboard(BuildContext context) {
  final FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
}

/// dummy  data

 List<Book> listOfBooks=[ Book(
    "1",
    "The Great Gatsby",
    "F. Scott Fitzgerald",
    "9780743273565",
    BookCategory.fantasy,
    BookCondition.veryGood,
    "10.99",
    "2.50",
    "https://i.postimg.cc/GmWBwWfk/book-demo-two.png",
    true,
    "A classic novel of the Jazz Age",
    const LocalUser(
        email: 'ali@gmail.com', name: 'ali', phone: '+923077373488'),
    const LocalUser(
        email: 'raza@gmail.com', name: 'raza', phone: '+923077373488')),
  Book(
      "2",
      "The Great Gatsby",
      "F. Scott Fitzgerald",
      "9780743273565",
      BookCategory.fantasy,
      BookCondition.veryGood,
      "10.99",
      "2.50",
      "https://i.postimg.cc/Tw7LSKvP/book-demo-four.jpg",
      true,
      "A classic novel of the Jazz Age",
      const LocalUser(
          email: 'ali@gmail.com', name: 'ali', phone: '+923077373488'),
      const LocalUser(
          email: 'ali@gmail.com', name: 'ali', phone: '+923077373488')),
  Book(
      "3",
      "The Great Gatsby",
      "F. Scott Fitzgerald",
      "9780743273565",
      BookCategory.fantasy,
      BookCondition.veryGood,
      "10.99",
      "2.50",
      "https://i.postimg.cc/CM4Sw3Rj/book-demo-one.jpg",
      true,
      "A classic novel of the Jazz Age",
      const LocalUser(
          email: 'ali@gmail.com', name: 'ali', phone: '+923077373488'),
      const LocalUser(
          email: 'ali@gmail.com', name: 'ali', phone: '+923077373488')),
  Book(
      "4",
      "The Great Gatsby",
      "F. Scott Fitzgerald",
      "9780743273565",
      BookCategory.fantasy,
      BookCondition.veryGood,
      "10.99",
      "2.50",
      "https://i.postimg.cc/CM4Sw3Rj/book-demo-one.jpg",
      true,
      "A classic novel of the Jazz Age",
      const LocalUser(
          email: 'ali@gmail.com', name: 'ali', phone: '+923077373488'),
      const LocalUser(
          email: 'ali@gmail.com', name: 'ali', phone: '+923077373488')),
  Book(
      "5",
      "The Great Gatsby",
      "F. Scott Fitzgerald",
      "9780743273565",
      BookCategory.fantasy,
      BookCondition.veryGood,
      "10.99",
      "2.50",
      "https://i.postimg.cc/CM4Sw3Rj/book-demo-one.jpg",
      true,
      "A classic novel of the Jazz Age",
      const LocalUser(
          email: 'ali@gmail.com', name: 'ali', phone: '+923077373488'),
      const LocalUser(
          email: 'ali@gmail.com', name: 'ali', phone: '+923077373488'))];

 List<Book> booksOfMarketplace= [Book(
    "1",
    "Macbeth",
    "William Shakespeare",
    "9780743273565",
    BookCategory.fantasy,
    BookCondition.brandNew,
    "10.99",
    "2.50",
    "https://i.postimg.cc/CM4Sw3Rj/book-demo-one.jpg",
    true,
    "A classic novel of the Jazz Age",
    const LocalUser(
        email: 'ali@gmail.com', name: 'ali', phone: '+923077373488'),
    const LocalUser(
        email: 'ali@gmail.com', name: 'ali', phone: '+923077373488')),
  Book(
      "2",
      "The Great Gatsby",
      "F. Scott Fitzgerald",
      "9780743273565",
      BookCategory.fantasy,
      BookCondition.veryGood,
      "49.99",
      "10.50",
      "https://i.postimg.cc/Tw7LSKvP/book-demo-four.jpg",
      true,
      "A classic novel of the Jazz Age",
      const LocalUser(
          email: 'ali@gmail.com', name: 'ali', phone: '+923077373488'),
      const LocalUser(
          email: 'Saleem@gmail.com', name: 'Saleem', phone: '+92123456645'))];

