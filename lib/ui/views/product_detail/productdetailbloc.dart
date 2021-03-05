import 'dart:convert';

import 'package:code_demo/core/config/base_bloc.dart';
import 'package:code_demo/core/config/local_variable.dart';
import 'package:code_demo/core/models/productdetailmodel.dart';
import 'package:code_demo/core/models/successmodel.dart';
import 'package:code_demo/core/services/http_request.dart';
import 'package:code_demo/ui/views/checkout_success/checkoutsuccess.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

part 'productdetailapi.dart';
class ProductDetailBloc extends BaseBloc{
  final BehaviorSubject<ProductDetailModel> productDetail =
  BehaviorSubject<ProductDetailModel>();

  void getDetail(int id){
    getProductDetailAPI(id).then((value) {
      productDetail.sink.add(value);
    });
  }

  void addToCart(int productId, int quantity){
    addToCartAPI(productId, quantity);
    Get.toNamed(CheckOutSuccessUI.ROUTER_NAME);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    productDetail.close();
  }

}