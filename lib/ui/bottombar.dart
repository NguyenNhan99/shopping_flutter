import 'package:code_demo/core/config/base_bloc.dart';
import 'package:code_demo/ui/views/home/homebloc.dart';
import 'package:code_demo/ui/views/home/homepage.dart';
import 'package:code_demo/ui/views/main_profile/mainprofile.dart';
import 'package:code_demo/ui/views/main_profile/mainprofilebloc.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBar extends StatefulWidget {
  static const ROUTER_NAME = '/BottomBar';
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int pageIndex = 0;
  Widget _currentPage = BlocProvider(
    bloc: HomeBloc  (),
    child: HomePageUI(),
  );

  Widget _pageChoosed(int pos) {
    switch (pos) {
      case 0:
        return BlocProvider(
          bloc: HomeBloc(),
          child: HomePageUI(),
        );
        break;
      // case 1:
      //   // return BlocProvider(
      //   //   bloc: HomeBloc(),
      //   //   child: HomePageUI(),
      //   // );
      //   break;
      case 1:
        return BlocProvider(
          bloc: MainProfileBloc(),
          child: MainProfileUI(),
        );
        break;
      default:
        return Container(
          child: const Center(
            child: Text(
              "Trang không tồn tại",
              style: TextStyle(fontSize: 30),
            ),
          ),
        );
    }
  }

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        body: _currentPage,
        bottomNavigationBar:
        FFNavigationBar(
          theme: FFNavigationBarTheme(
            barBackgroundColor: Colors.white,
            selectedItemBackgroundColor:  Color(0xFF3366FF),
            selectedItemIconColor: Colors.white,
            selectedItemLabelColor: Colors.black,
          ),
          selectedIndex: pageIndex,
          onSelectTab: (index) {
                if (index == pageIndex) return;
                pageIndex = index;
                setState(() {
                  _currentPage = _pageChoosed(index);
                });
          },

          items: [
            FFNavigationBarItem(
              iconData: Icons.home,
              itemWidth: 80,
              label: 'Trang chủ',
            ),

            // FFNavigationBarItem(
            //   iconData: Icons.shopping_cart_outlined,
            //   itemWidth: 80,
            //   label: 'Giỏ hàng',
            // ),

            FFNavigationBarItem(
              iconData: Icons.perm_contact_cal,
              itemWidth: 80,
              label: 'Thông tin',
            ),

          ],
        ),
        );
  }
}
