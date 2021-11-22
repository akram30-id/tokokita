import 'package:shared_preferences/shared_preferences.dart';

class UserInfo{
  Future setToken(String value)async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString('token', value);
  }

  Future<String> getToken()async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('token');
  }

  Future setUserId(int value)async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setInt('userId', value);
  }

  Future<int> getUserId()async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('userId');
  }

  Future logout()async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }
}
