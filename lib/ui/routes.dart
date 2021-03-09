import 'package:code_demo/core/config/base_bloc.dart';
import 'package:code_demo/ui/views/checkout_success/checkoutsuccess.dart';
import 'package:code_demo/ui/views/detail/detailui.dart';
import 'package:code_demo/ui/views/home/homebloc.dart';
import 'package:code_demo/ui/views/home/homepage.dart';
import 'package:code_demo/ui/views/loading/loading.dart';
import 'package:code_demo/ui/views/main_profile/mainprofile.dart';
import 'package:code_demo/ui/views/main_profile/mainprofilebloc.dart';
import 'package:code_demo/ui/views/order_detail/orderdetail.dart';
import 'package:code_demo/ui/views/order_detail/orderdetailbloc.dart';
import 'package:code_demo/ui/views/order_list/orderlist.dart';
import 'package:code_demo/ui/views/order_list/orderlistbloc.dart';
import 'package:code_demo/ui/views/product_detail/productdetail.dart';
import 'package:code_demo/ui/views/product_detail/productdetailbloc.dart';
import 'package:code_demo/ui/views/product_list/productlist.dart';
import 'package:code_demo/ui/views/product_list/productlistbloc.dart';
import 'package:code_demo/ui/views/profile_detail/profiledetail.dart';
import 'package:code_demo/ui/views/profile_detail/profiledetailbloc.dart';
import 'package:code_demo/ui/views/search_page/searchpage.dart';
import 'package:code_demo/ui/views/search_page/searchpagebloc.dart';
import 'package:code_demo/ui/views/search_result/searchresult.dart';
import 'package:code_demo/ui/views/wish_list/wishlist.dart';
import 'package:code_demo/ui/views/wish_list/wishlistbloc.dart';
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
          page: () => BlocProvider(bloc: ProductListBloc(), child: ProductListUI())),
      GetPage(name: CheckOutSuccessUI.ROUTER_NAME, page: () => const CheckOutSuccessUI()),
      GetPage(
          name: MainProfileUI.ROUTER_NAME,
          page: () => BlocProvider(bloc: MainProfileBloc(), child: MainProfileUI())),
      GetPage(
          name: WishListUI.ROUTER_NAME,
          page: () => BlocProvider(bloc: WishListBloc(), child: WishListUI())),
      GetPage(
          name: OrderListUI.ROUTER_NAME,
          page: () => BlocProvider(bloc: OrderListBloc(), child: OrderListUI())),
      GetPage(
          name: OrderDetailUI.ROUTER_NAME,
          page: () => BlocProvider(bloc: OrderDetailBloc(), child: OrderDetailUI())),
      GetPage(
          name: SearchPageUI.ROUTER_NAME,
          page: () => BlocProvider(bloc: SearchPageBloc(), child: SearchPageUI())),
      GetPage(name: SearchResultUI.ROUTER_NAME, page: () => const SearchResultUI()),
      GetPage(
          name: ProfileDetailUI.ROUTER_NAME,
          page: () => BlocProvider(bloc: ProfileDetailBloc(), child: ProfileDetailUI())),

    ];

    return router;
  }
}