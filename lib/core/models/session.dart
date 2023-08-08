import 'package:location_app/core/models/user.dart';

class Session {
  Session({
    required this.connectedUser,
    this.accessToken,
    this.refreshToken,
  });

  User connectedUser;
  String? accessToken;
  String? refreshToken;
}