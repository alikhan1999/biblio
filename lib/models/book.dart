import 'package:biblio_bazar/models/enums/book_category.dart';
import 'package:biblio_bazar/models/enums/book_condition.dart';
import 'package:biblio_bazar/models/local_user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable(explicitToJson: true)
class Book {
  final String id;
  final String title;
  final String author;
  final String isbn;
  final BookCategory category;
  final BookCondition condition;
  final String price;
  final String deliveryFee;
  final String imagePath;
  final bool hasHardCover;
  bool favorite;
  final String description;
  final LocalUser seller;
  final LocalUser? buyer;

   Book(
    this.id,
    this.title,
    this.author,
    this.isbn,
    this.category,
    this.condition,
    this.price,
    this.deliveryFee,
    this.imagePath,
    this.hasHardCover,
    this.description,
    this.seller,
    this.buyer,
  {this.favorite=false}
  );



  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);
}
