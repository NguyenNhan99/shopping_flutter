import 'package:code_demo/ui/views/home/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../bottombar.dart';

class LoadingUI extends StatefulWidget {
  static const ROUTER_NAME = '/';
  const LoadingUI();
  @override
  _LoadingUIState createState() => _LoadingUIState();
}

class _LoadingUIState extends State<LoadingUI> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeRoute();

  }

  changeRoute() async {
    await Future.delayed(Duration(seconds: 1), () {
      Get.toNamed(BottomBar
          .ROUTER_NAME,);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
