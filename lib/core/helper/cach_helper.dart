import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  static late SharedPreferences sharedPreferences ;
  
  init() async{
    sharedPreferences =await SharedPreferences.getInstance();
  }

  Future<bool> saveData({required String key , required dynamic value}){
    if(value is int){
      return sharedPreferences.setInt(key, value);
    }else if(value is double){
      return sharedPreferences.setDouble(key, value);
    }else if(value is String){
      return sharedPreferences.setString(key, value);
    }else if(value is bool){
      return sharedPreferences.setBool(key, value);
    }else{
      return sharedPreferences.setStringList(key, value);
    }
  }

  dynamic getData({required String key}){
    return sharedPreferences.get(key);
  }
  Future<bool> removeData({required String key}){
    return sharedPreferences.remove(key);
  }
  Future<bool> clearData(){
    return sharedPreferences.clear();
  }
  bool containData({required String key}){
    return sharedPreferences.containsKey(key);
  }
  
}
