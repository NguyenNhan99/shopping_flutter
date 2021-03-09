
import 'dart:convert';

import 'package:code_demo/core/config/base_bloc.dart';
import 'package:code_demo/core/config/local_variable.dart';
import 'package:code_demo/core/models/updatemodel.dart';
import 'package:code_demo/core/services/http_request.dart';
import 'package:code_demo/ui/bottombar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

part 'profiledetailapi.dart';
class ProfileDetailBloc extends BaseBloc{
  final BehaviorSubject<UpdateModel> updateP =
  BehaviorSubject<UpdateModel>();


  void updateProfile(String hoten){
    updateProfileAPI(hoten);
    Get.toNamed(BottomBar.ROUTER_NAME);
    Get.snackbar("Thông báo", "Cập nhập thông tin thành công");
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    updateP.close();
  }

}