import 'dart:convert';

import 'package:code_demo/core/config/base_bloc.dart';
import 'package:code_demo/core/config/local_variable.dart';
import 'package:code_demo/core/models/productlistmodel.dart';
import 'package:code_demo/core/services/http_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

part 'productlistapi.dart';
class ProductListBloc extends BaseBloc{
  final BehaviorSubject<ProductListModel> productList =
  BehaviorSubject<ProductListModel>();

  void getList(int id){
    getProductList(id).then((value) {
      productList.sink.add(value);
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    productList.close();
  }

}