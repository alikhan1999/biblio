import 'package:json_annotation/json_annotation.dart';

part 'local_user.g.dart';

@JsonSerializable(explicitToJson: true)
class LocalUser {
  final String email;
  final String name;
  final String phone;
  final String? imagePath;
  final String? fcm;
  final String? storeName;
  final String? storeAddress;

  const LocalUser( {
    required this.email,
    required this.name,
    required this.phone,
    this.imagePath,
    this.fcm,
    this.storeName,
    this.storeAddress,
  });

  factory LocalUser.fromJson(Map<String, dynamic> json) =>
      _$LocalUserFromJson(json);

  Map<String, dynamic> toJson() => _$LocalUserToJson(this);
}
