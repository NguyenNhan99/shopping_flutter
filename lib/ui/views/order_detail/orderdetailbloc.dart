import 'dart:convert';

import 'package:code_demo/core/config/base_bloc.dart';
import 'package:code_demo/core/config/local_variable.dart';
import 'package:code_demo/core/models/orderdetailmodel.dart';
import 'package:code_demo/core/services/http_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
part 'orderdetailapi.dart';

class OrderDetailBloc extends BaseBloc{

  final BehaviorSubject<OrderDetailModel> orderDetail =
  BehaviorSubject<OrderDetailModel>();

  void getOrderDetail(int id){
    getOrderDetailAPI(id).then((value) {
      orderDetail.sink.add(value);
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    orderDetail.close();
  }



}