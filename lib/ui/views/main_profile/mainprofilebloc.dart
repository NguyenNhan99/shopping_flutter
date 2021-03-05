import 'dart:convert';

import 'package:code_demo/core/config/base_bloc.dart';
import 'package:code_demo/core/config/local_variable.dart';
import 'package:code_demo/core/models/profilemodel.dart';
import 'package:code_demo/core/services/http_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
part 'mainprofileapi.dart';
class MainProfileBloc extends BaseBloc{
  final BehaviorSubject<ProfileModel> profile =
  BehaviorSubject<ProfileModel>();

  void getProfile(){
    getProfileAPI().then((value) {
      profile.sink.add(value);
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    profile.close();
  }

}