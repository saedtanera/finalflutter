import 'package:shared_preferences/shared_preferences.dart';

class SpHelper{
  static late SharedPreferences sp;
  static inisp()async{
    sp = await SharedPreferences.getInstance();
  }
  static creatNewItem(String key,String value){
    sp.setString(key, value);
  }
  static String? getItem(String key){
   String? rs= sp.getString(key);
    return rs;
  }

  deleItem (String key){
    sp.remove(key);
  }
  updateItem(String key,String value){
    sp.setString(key, value);
  }

  static Check(){
    String? res=sp.getString('name');
    if(res==null){
      return true;
    }else
    return false;
  }
}

