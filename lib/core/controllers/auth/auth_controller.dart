import '../../../export.dart';
import '../../models/payloads/register_request.dart';

import '../../models/session.dart';
import '../../models/user.dart';
import '../../service/api/auth/auth_service.dart';
import '../../service/storage.dart';
class AuthController extends ChangeNotifier {
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

  Session? get session => _session;

  set session(Session? session) {
    _session = session;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    requestLoading = true;
    bool success = false;

    try {
      User? res = await _authService.login(email, password);

      if (res != null) {
        _session = Session(connectedUser: res);
        success = true;
        await StorageService().saveConnectedUser(_session!.connectedUser);
        print(res);
      }
    } on Exception catch (e) {
      hasError = true;
      errorMessage = e.toString();
    } finally {
      requestLoading = false;
      notifyListeners();
    }
    print(success.toString());

    return success;
  }

  Future<bool> register(RegisterRequest payload) async {
    requestLoading = true;
    bool success = false;

    try {
      success = await _authService.register(payload);
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
