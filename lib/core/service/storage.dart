import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class StorageService {
  bool isSignedIn = false;
  Future<User?> getConnectedUser() async {
    User? user;
    final pref = await SharedPreferences.getInstance();

    final prefUser = pref.getString('connectedUser');

    if (prefUser != null) {
      user = User.fromJson(jsonDecode(prefUser) as Map<String, dynamic>);
    }

    return user;
  }

  Future<String?> getUserToken() async {
    final pref = await SharedPreferences.getInstance();

    return pref.getString('userToken');

  }
  Future<String?> getUserId() async {
    final pref = await SharedPreferences.getInstance();

    return pref.getString('userId');

  }

  Future<void> saveConnectedUser(User? user) async {
    final pref = await SharedPreferences.getInstance();

    await pref.setString('connectedUser', jsonEncode(user));
  }

  Future<void> saveUserToken(String? token) async {
    final pref = await SharedPreferences.getInstance();

    await pref.setString('userToken', token!);
  }

  Future<void> saveUserId(String? id) async {
    final pref = await SharedPreferences.getInstance();

    await pref.setString('userId', id!);
  }


  Future<bool> isFirstConnection() async {
    final pref = await SharedPreferences.getInstance();
    return  isSignedIn = pref.getBool('firstConnection')??true;
  }

  Future<void> saveFirstConnection() async {
    final pref = await SharedPreferences.getInstance();

    await pref.setBool('firstConnection', false);
    isSignedIn = false;
  }
}


