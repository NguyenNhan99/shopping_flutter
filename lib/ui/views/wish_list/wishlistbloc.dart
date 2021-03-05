import 'dart:convert';

import 'package:code_demo/core/config/base_bloc.dart';
import 'package:code_demo/core/config/local_variable.dart';
import 'package:code_demo/core/models/wishlistmodel.dart';
import 'package:code_demo/core/services/http_request.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

part 'wishlistapi.dart';
class WishListBloc extends BaseBloc{
  final BehaviorSubject<WishListModel> wishlist =
  BehaviorSubject<WishListModel>();

  void getWistList(){
    getWishListAPI().then((value) {
      wishlist.sink.add(value);
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    wishlist.close();
  }

}