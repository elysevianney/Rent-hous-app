import 'package:location_app/core/models/chat.dart';
import 'package:location_app/core/models/payloads/createChat_request.dart';
import 'package:location_app/core/models/post.dart';
import 'package:location_app/core/service/api/annonce/annonce_service.dart';

import '../../../export.dart';

import '../../models/payloads/createPost_request.dart';
import '../../models/payloads/register_request.dart';
import '../../models/session.dart';
import '../../models/user.dart';
import '../../service/api/auth/auth_service.dart';
import '../../service/api/chat/chat_service.dart';
import '../../service/storage.dart';

class ChatDataController extends ChangeNotifier {
  final AuthService _authService = AuthService();

  bool _requestLoading = false;
  bool _hasError = false;
  late String _errorMessage;
  Session? _session;

  bool get requestLoading => _requestLoading;

  set requestLoading(bool loading) {
    _requestLoading = loading;
    notifyListeners();
  }

  bool get hasError => _hasError;

  set hasError(bool err) {
    _hasError = err;
    notifyListeners();
  }

  String get errorMessage => _errorMessage;

  set errorMessage(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  final ChatService _chatService = ChatService();
  List<Chat>? _allChats;
  List<Chat>? get allChatService => _allChats;

  Future<List<Chat>?> getChat() async {
    _allChats = await _chatService.getChat();
    if (_allChats != null) {
      return _allChats;
    } else {
      return null;
    }
  }
  Future<Chat?> viewChat(String id) async {
    Chat? chat = await _chatService.viewChat(id);
    if (chat != null) {
      return chat;
    } else {
      return null;
    }
  }


  Future<bool?> createChat(CreateChatRequest payload) async {
    requestLoading = true;
    bool? success;

    try {

      success = await _chatService.createChat(payload);
      print('yes controller');
      return success;
    } catch (e) {
      hasError = true;
      errorMessage = e.toString();
    } finally {
      requestLoading = false;
      notifyListeners();
    }

    return success;
  }

}
