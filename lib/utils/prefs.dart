import 'dart:convert';

import 'package:biblio_bazar/models/book.dart';
import 'package:biblio_bazar/models/local_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  Prefs._sharedPrefs();

  static final Prefs instance = Prefs._sharedPrefs();
  static late SharedPreferences _prefs;

  Future<void> init() async => _prefs = await SharedPreferences.getInstance();

  static const _keyUser = 'user';
  static const _keyWishlist = 'wishList';

  Future<bool> setUser(LocalUser user) =>
      _prefs.setString(_keyUser, jsonEncode(user.toJson()));

  LocalUser? get user {
    try {
      final userString = _prefs.getString(_keyUser);
      if (userString != null) {
        final userJson = jsonDecode(userString);
        return LocalUser.fromJson(userJson);
      }
    } catch (error) {
      print("Error occurred: $error");
    }
    return null;
  }

  Future<bool> setWishlist(List<Book> items) async {
    final _prefsList = _prefs.getStringList(_keyWishlist) ?? [];
    List<String> itemList = [];

    itemList = _prefsList +
        items.map((person) => jsonEncode(person.toJson())).toList();
    itemList = itemList.toSet().toList();

    await _prefs.setStringList(_keyWishlist, itemList);
    return true;
  }

  List<Book> getWishListItems() {
    final _prefsList = _prefs.getStringList(_keyWishlist) ?? [];

    List<Book> _list = [];
    _prefsList.map((e) => _list.add(Book.fromJson(jsonDecode(e)))).toList();
    return _list;
  }

  void removeFile(String bookId)async{
    final _prefsList = _prefs.getStringList(_keyWishlist) ?? [];
    List<Book> _list = [];
    _prefsList.map((e) => _list.add(Book.fromJson(jsonDecode(e)))).toList();
   final index =_list.indexWhere((element) => element.id.contains(bookId));
    _prefsList.removeAt(index) ;
    await _prefs.setStringList(_keyWishlist, _prefsList);


  }
  Future<bool> removeUser() => _prefs.remove(_keyUser);
}
