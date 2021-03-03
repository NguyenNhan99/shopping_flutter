import 'dart:convert';

import 'package:code_demo/core/config/base_bloc.dart';
import 'package:code_demo/core/config/local_variable.dart';
import 'package:code_demo/core/models/homemodel.dart';
import 'package:code_demo/core/services/http_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

part 'homeapi.dart';
class HomeBloc extends BaseBloc{
  final BehaviorSubject<HomeModel> home =
  BehaviorSubject<HomeModel>();

  void getHome(){
    getHomeAPI().then((value) {
      print(value);
      home.sink.add(value);
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    home.close();
  }

}