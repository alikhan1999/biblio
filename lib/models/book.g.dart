// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      json['id'] as String,
      json['title'] as String,
      json['author'] as String,
      json['isbn'] as String,
      $enumDecode(_$BookCategoryEnumMap, json['category']),
      $enumDecode(_$BookConditionEnumMap, json['condition']),
      json['price'] as String,
      json['deliveryFee'] as String,
      json['imagePath'] as String,
      json['hasHardCover'] as bool,
      json['description'] as String,
      LocalUser.fromJson(json['seller'] as Map<String, dynamic>),
      json['buyer'] == null
          ? null
          : LocalUser.fromJson(json['buyer'] as Map<String, dynamic>),
      favorite: json['favorite'] as bool? ?? false,
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'isbn': instance.isbn,
      'category': _$BookCategoryEnumMap[instance.category]!,
      'condition': _$BookConditionEnumMap[instance.condition]!,
      'price': instance.price,
      'deliveryFee': instance.deliveryFee,
      'imagePath': instance.imagePath,
      'hasHardCover': instance.hasHardCover,
      'favorite': instance.favorite,
      'description': instance.description,
      'seller': instance.seller.toJson(),
      'buyer': instance.buyer?.toJson(),
    };

const _$BookCategoryEnumMap = {
  BookCategory.classic: 'classic',
  BookCategory.romance: 'romance',
  BookCategory.poetry: 'poetry',
  BookCategory.mystery: 'mystery',
  BookCategory.thriller: 'thriller',
  BookCategory.horror: 'horror',
  BookCategory.fantasy: 'fantasy',
  BookCategory.sciFi: 'sciFi',
  BookCategory.health: 'health',
  BookCategory.history: 'history',
  BookCategory.humor: 'humor',
  BookCategory.comic: 'comic',
  BookCategory.selfHelp: 'selfHelp',
  BookCategory.autobiography: 'autobiography',
  BookCategory.children: 'children',
};

const _$BookConditionEnumMap = {
  BookCondition.brandNew: 'brandNew',
  BookCondition.openBox: 'openBox',
  BookCondition.veryGood: 'veryGood',
  BookCondition.good: 'good',
  BookCondition.fair: 'fair',
  BookCondition.poor: 'poor',
};
