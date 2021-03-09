import 'dart:convert';

import 'package:code_demo/core/config/base_bloc.dart';
import 'package:code_demo/core/config/local_variable.dart';
import 'package:code_demo/core/models/searchmodel.dart';
import 'package:code_demo/core/services/http_request.dart';
import 'package:code_demo/ui/views/search_result/searchresult.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

part 'searchpageapi.dart';
class SearchPageBloc extends BaseBloc{
  final BehaviorSubject<List<String>> searchPage =
  BehaviorSubject<List<String>>();
  List<String> search = <String>[];

  void getSearch(String keySearch){

    getSearchAPI(keySearch).then((value) {
      search.add(keySearch);
      searchPage.sink.add(search);
      Get.toNamed(SearchResultUI
          .ROUTER_NAME, arguments: {'searchResult': value, 'key': keySearch});
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchPage.close();
  }
}