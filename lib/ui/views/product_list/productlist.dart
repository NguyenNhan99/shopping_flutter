import 'package:code_demo/core/config/base_bloc.dart';
import 'package:code_demo/core/config/local_variable.dart';
import 'package:code_demo/core/models/homemodel.dart';
import 'package:code_demo/core/models/productlistmodel.dart';
import 'package:code_demo/ui/views/product_detail/productdetail.dart';
import 'package:code_demo/ui/views/product_list/productlistbloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProductListUI extends StatefulWidget {
  static const String ROUTER_NAME = '/ProductListUI';
  @override
  _ProductListUIState createState() => _ProductListUIState();
}

class _ProductListUIState extends State<ProductListUI> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Categories categories;
  final String url = LocalVariable.instance.urlAPI;
  String result;
  ProductListBloc _productListBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final Map data = Map.from(Get.arguments);
    categories = data['detailProduct'];
    _productListBloc = BlocProvider.of<ProductListBloc>(context);
    _productListBloc.getList(categories.categoryId);
    result = 'Giá giảm dần';
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kMinInteractiveDimension - 120) / 2;
    final double itemWidth = size.width / 1.6;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(categories.subCategory[0].name),
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      endDrawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // Important: Remove any padding from the ListView.
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text(
                    'Bộ lọc sản phẩm',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Khoảng giá',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  20.0) //                 <--- border radius here
                              )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          'Huỷ',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(
                                  20.0) //                 <--- border radius here
                              )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          'Áp Dụng',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                  icon: const Icon(
                    Icons.wifi_protected_setup,
                    color: Colors.blue,
                  ),
                  onPressed: () {}),
              GestureDetector(
                onTap: () => showBottom(),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_drop_down,
                        ),
                        Text(result),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              IconButton(
                  icon: const Icon(
                    Icons.filter_list_alt,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    _scaffoldKey.currentState.openEndDrawer();
                  }),
              Text('Bộ lọc'),
              SizedBox(
                width: 10,
              )
            ],
          ),
          Divider(),
          Expanded(
            child: StreamBuilder(
              stream: _productListBloc.productList.stream,
              builder: (context, AsyncSnapshot<ProductListModel> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.active:
                  case ConnectionState.done:
                    if (snapshot.hasData)
                      return GridView.builder(
                        primary: false,
                        padding: EdgeInsets.zero,
                        itemCount: snapshot.data.data.products.length,
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: (itemWidth / itemHeight)),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                print('ấd');
                                Get.toNamed(ProductDetailUI
                                    .ROUTER_NAME, arguments: {'detailProduct': snapshot.data.data.products[index].categoryId});
                              },
                              child: Container(

                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0, -1),
                                        blurRadius: 10)
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    (snapshot.data.data.products[index].isPromotion != 0)?Container(
                                      height: 20,
                                      width: 70,
                                      decoration:BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.only( bottomRight: Radius.circular(40)
                                        ),
                                      ), //             <--- BoxDecoration here
                                      child: Center(
                                        child: Text(
                                          "7%",
                                          style: TextStyle(fontSize: 15.0,color: Colors.white),
                                        ),
                                      ),
                                    ):SizedBox.shrink(),
                                    SizedBox(height: 5,),
                                    Center(
                                      child: Image.network(
                                        '$url${snapshot.data.data.products[index].image}',
                                        width: 150,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '${snapshot.data.data.products[index].name}',maxLines: 2,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text(
                                        "${NumberFormat('#,###', "vi_VN").format(snapshot.data.data.products[index].price)}đ",
                                        style: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),

                                    // Stack(
                                    //   children: [
                                    //     Image.network(
                                    //       'https://trongnv.me/uploads/images/category/w480/1-he-thong-bao-dong-2-XxWZM.jpg',
                                    //       width: Get.width * 0.5,
                                    //     ),
                                    //     SizedBox(
                                    //       height: 5,
                                    //     ),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    else
                      return Center(child: Text('Không có sản phẩm này'));
                    break;
                  default:
                    return Container();
                }

              }
            ),
          ),
        ],
      ),
    );
  }

  Future showBottom() async {
    result = await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      enableDrag: false,
      builder: (context) => AnimatedPadding(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: Get.height * 0.4,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        'Danh sách chức năng',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.close,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                GestureDetector(
                  onTap: (){
                    Get.back(result: 'Giá giảm dần');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Giá giảm dần',
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        Icon(
                          Icons.arrow_right,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(),
                GestureDetector(
                  onTap: (){
                    Get.back(result: 'Giá tăng dần');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Giá tăng dần',
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        Icon(
                          Icons.arrow_right,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(),
                GestureDetector(
                  onTap: (){
                    Get.back(result: 'Sản phẩm mới');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sản phẩm mới',
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        Icon(
                          Icons.arrow_right,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
    print(result);
    if (result != null) {
      setState(() {
        result;
      });
    } else {
      setState(() {
        result = 'Giá giảm dần';
      });
    }
  }
}
