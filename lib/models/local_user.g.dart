// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalUser _$LocalUserFromJson(Map<String, dynamic> json) => LocalUser(
      email: json['email'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      imagePath: json['imagePath'] as String?,
      fcm: json['fcm'] as String?,
      storeName: json['storeName'] as String?,
      storeAddress: json['storeAddress'] as String?,
    );

Map<String, dynamic> _$LocalUserToJson(LocalUser instance) => <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'imagePath': instance.imagePath,
      'fcm': instance.fcm,
      'storeName': instance.storeName,
      'storeAddress': instance.storeAddress,
    };
