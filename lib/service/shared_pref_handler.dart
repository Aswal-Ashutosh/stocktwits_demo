import 'package:demo/constants/shared_preferences_keys.dart';
import 'package:demo/service/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHandler{
  static SharedPreferences? _sharedPrefInstance;

  static Future<void> _init() async{
    _sharedPrefInstance = await SharedPreferences.getInstance();
  }

  static Future<void> save({String userId = '', String userName = '', String acecessToken = ''})async{
    if(_sharedPrefInstance == null)
      await _init();
    _sharedPrefInstance?.setString(USER_ID, userId);
    _sharedPrefInstance?.setString(USER_NAME, userName);
    _sharedPrefInstance?.setString(ACCESS_TOKEN, acecessToken);
  }

  static Future<void> delete()async{
     if(_sharedPrefInstance == null)
      await _init();
    _sharedPrefInstance?.remove(USER_ID);
    _sharedPrefInstance?.remove(USER_NAME);
    _sharedPrefInstance?.remove(ACCESS_TOKEN);
  }

  static Future<bool> get exist async {
    if(_sharedPrefInstance == null)
      await _init();
    final userId = _sharedPrefInstance?.getString(USER_ID) ?? null;
    return userId != null;
  }

  static Future<User> get user async {
    if(_sharedPrefInstance == null)
      await _init();
    final userId = _sharedPrefInstance?.getString(USER_ID);
    final userName = _sharedPrefInstance?.getString(USER_NAME);
    final accessToken = _sharedPrefInstance?.getString(ACCESS_TOKEN);
    return User(userId: userId, userName: userName, accessToken: accessToken);
  }
}