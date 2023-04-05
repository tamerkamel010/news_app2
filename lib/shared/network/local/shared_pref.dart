import 'package:shared_preferences/shared_preferences.dart';
class shared_pref{
  static SharedPreferences? shared;
  static init()async{
    shared = await SharedPreferences.getInstance();
   }
   ///general method
  static Future<bool> putbool({required String key,required value})async{
   return await shared!.setBool(key, value);
   }
  static bool? getbool({required String key}){
    return shared!.getBool(key);
  }

}

