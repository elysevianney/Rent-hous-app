import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class StorageService {
  Future<User?> getConnectedUser() async {
    User? user;
    SharedPreferences pref = await SharedPreferences.getInstance();

    String? prefUser = pref.getString("connectedUser");

    if (prefUser != null) {
      user = User.fromJson(jsonDecode(prefUser));
    }

    return user;
  }

  Future<void> saveConnectedUser(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setString('connectedUser', jsonEncode(user));
  }

  Future<bool?> isFirstConnection() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.getBool('firstConnection');
  }

  Future<void> saveFirstConnection() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setBool('firstConnection', true);
  }
}
