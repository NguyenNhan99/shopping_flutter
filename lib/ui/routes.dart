import 'package:code_demo/core/config/base_bloc.dart';
import 'package:code_demo/ui/views/detail/detailui.dart';
import 'package:code_demo/ui/views/home/homebloc.dart';
import 'package:code_demo/ui/views/home/homepage.dart';
import 'package:code_demo/ui/views/loading/loading.dart';
import 'package:code_demo/ui/views/product_detail/productdetail.dart';
import 'package:code_demo/ui/views/product_detail/productdetailbloc.dart';
import 'package:code_demo/ui/views/productlist/productlist.dart';
import 'package:code_demo/ui/views/productlist/productlistbloc.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'bottombar.dart';

class RouterManager {
  static List<GetPage> router() {
    final List<GetPage> router = <GetPage>[
      GetPage(name: LoadingUI.ROUTER_NAME, page: () => const LoadingUI()),
      GetPage(name: BottomBar.ROUTER_NAME, page: () => BottomBar()),
      GetPage(
          name: HomePageUI.ROUTER_NAME,
          page: () => BlocProvider(bloc: HomeBloc(), child: HomePageUI())),
      GetPage(name: DetailUI.ROUTER_NAME, page: () => const DetailUI()),
      GetPage(
          name: ProductDetailUI.ROUTER_NAME,
          page: () => BlocProvider(bloc: ProductDetailBloc(), child: ProductDetailUI())),
      GetPage(
          name: ProductListUI.ROUTER_NAME,
          page: () => BlocProvider(bloc: ProductListBloc(), child: ProductListUI()))

    ];

    return router;
  }
}