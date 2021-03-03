import 'package:code_demo/core/services/shared_pref.dart';
import 'package:code_demo/ui/routes.dart';
import 'package:code_demo/ui/views/home/homepage.dart';
import 'package:code_demo/ui/views/loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

Future<void> main() async {
  await init();
  runApp(MyApp());
}

Future init() async {


  WidgetsFlutterBinding.ensureInitialized();

  await SharedPref.getInstance();
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'final_project',
      enableLog: false,
      debugShowCheckedModeBanner: false,
      getPages: RouterManager.router(),
      home: LoadingUI(),
    );
  }
}
