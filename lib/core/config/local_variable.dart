import 'package:code_demo/core/services/shared_pref.dart';

class LocalVariable {
  LocalVariable._();
  static LocalVariable instance = LocalVariable._();
  static Future<LocalVariable> getInstance({bool isRefresh = false}) async {
    if (!isRefresh)
      return instance;
    else {
      instance = LocalVariable._();
      return instance;
    }
  }


  String urlAPI = 'https://trongnv.me';


}