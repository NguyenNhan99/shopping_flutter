import 'dart:convert';

import 'package:code_demo/core/config/base_bloc.dart';
import 'package:code_demo/core/config/local_variable.dart';
import 'package:code_demo/core/models/productdetailmodel.dart';
import 'package:code_demo/core/services/http_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

part 'productdetailapi.dart';
class ProductDetailBloc extends BaseBloc{
  final BehaviorSubject<ProductDetailModel> productDetail =
  BehaviorSubject<ProductDetailModel>();

  void getDetail(int id){
    getProductDetail(id).then((value) {
      productDetail.sink.add(value);
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    productDetail.close();
  }

}