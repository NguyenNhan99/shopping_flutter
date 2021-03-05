import 'package:carousel_slider/carousel_slider.dart';
import 'package:code_demo/core/config/base_bloc.dart';
import 'package:code_demo/core/config/local_variable.dart';
import 'package:code_demo/core/models/productdetailmodel.dart';
import 'package:code_demo/ui/views/product_detail/productdetailbloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import 'package:intl/intl.dart';

class ProductDetailUI extends StatefulWidget {
  static const String ROUTER_NAME = '/ProductDetailUI';

  @override
  _ProductDetailUIState createState() => _ProductDetailUIState();
}


class _ProductDetailUIState extends State<ProductDetailUI> {
  ProductDetailBloc _productDetailBloc;
  final String url = LocalVariable.instance.urlAPI;
  int _current = 0;
  bool ischeck;
  int categoryId;
  int productID;
  int numItems = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productDetailBloc = BlocProvider.of<ProductDetailBloc>(context);
    ischeck = true;
    final Map data = Map.from(Get.arguments);
    categoryId = data['detailProduct'];
    _productDetailBloc.getDetail(categoryId);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: StreamBuilder(
            stream: _productDetailBloc.productDetail.stream,
            builder: (context, AsyncSnapshot<ProductDetailModel> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                case ConnectionState.done:
                  if (snapshot.hasData){
                    productID = snapshot.data.data.productId;
                    return NestedScrollView(

                      headerSliverBuilder:
                          (BuildContext context, bool innerBoxIsScrolled) {
                        return <Widget>[
                          SliverAppBar(
                            backgroundColor: Colors.grey.withOpacity(0.2),
                            actions: [
                              IconButton(
                                icon: Icon(Icons.shopping_cart_outlined),
                                onPressed: () {},
                              ),
                            ],
                            expandedHeight: 250.0,
                            floating: false,
                            pinned: true,
                            flexibleSpace: FlexibleSpaceBar(
                                background: Swiper(
                                  itemCount: snapshot.data.data.imagesUrl.length,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                      Image.network(
                                        '$url${snapshot.data.data.imagesUrl[index]}',
                                        fit: BoxFit.fill,
                                      ),
                                  onIndexChanged: (index) {
                                    setState(() {
                                      _current = index;
                                    });
                                  },
                                )),
                          ),
                        ];
                      },
                      body: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: snapshot.data.data.imagesUrl.map((url) {
                                int index = snapshot.data.data.imagesUrl.indexOf(url);
                                return Container(
                                  width: 10.0,
                                  height: 10.0,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 2.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    shape: BoxShape.circle,
                                    color:_current != index
                                        ? Color(0xFF3366FF)
                                        : Colors.grey,
                                  ),
                                );
                              }).toList(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data.data.name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${NumberFormat('#,###', "vi_VN").format(snapshot.data.data.price)}đ",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (ischeck == true) {
                                              ischeck = false;
                                            } else {
                                              ischeck = true;

                                            }
                                          });
                                        },
                                        child: (ischeck)
                                            ? Container(
                                          padding: EdgeInsets.all(8),
                                          height: 32,
                                          width: 32,
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            shape: BoxShape.circle,
                                          ),
                                          child: SvgPicture.asset(
                                              "assets/icons/heart.svg"),
                                        )
                                            : Container(
                                          padding: EdgeInsets.all(8),
                                          height: 32,
                                          width: 32,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFF6464),
                                            shape: BoxShape.circle,
                                          ),
                                          child: SvgPicture.asset(
                                              "assets/icons/heart.svg"),
                                        ),
                                      )
                                    ],
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Model: ',
                                      style: TextStyle(color: Colors.grey),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: snapshot.data.data.sku,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF3366FF))),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Kho hàng: ',
                                      style: TextStyle(color: Colors.grey),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Còn ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF3366FF))),
                                        TextSpan(
                                            text: '${snapshot.data.data.stock}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF3366FF))),
                                        TextSpan(
                                            text: ' sản phẩm',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF3366FF))),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Vận chuyển: ',
                                      style: TextStyle(color: Colors.grey),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text:
                                            snapshot.data.data.description,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 10,
                              width: Get.width,
                              color: Colors.grey.withOpacity(0.2),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Text('Số lượng:  '),
                                  CustomButton(
                                    icon: Icons.remove,
                                    press: () {
                                      if (numItems > 1) {
                                        setState(() {
                                          numItems--;
                                        });
                                      }
                                    },
                                  ),
                                  Container(
                                    width: 60,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      border: Border.all( color: Colors.grey.withOpacity(0.4),),
                                    ),
                                    child: Center(
                                      child: Text(
                                        numItems.toString().padLeft(2, "0"),
                                        style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  CustomButton(
                                      icon: Icons.add,
                                      press: () {
                                        setState(() {
                                          numItems++;
                                        });
                                      }),
                                ],
                              ),
                            ),
                            Container(
                              height: 10,
                              width: Get.width,
                              color: Colors.grey.withOpacity(0.2),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, top: 8,right: 8, bottom: 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Thông tin sản phẩm',
                                    style:
                                    TextStyle(fontSize: 15, color: Colors.black),
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                  ),
                                ],
                              ),
                            ),
                            const Divider(),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, top: 8,right: 8, bottom: 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Tài liệu kỉ thuật',
                                    style:
                                    TextStyle(fontSize: 15, color: Colors.black),
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                  ),
                                ],
                              ),
                            ),
                            const Divider(),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, top: 8,right: 8, bottom: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Phụ kiện kèm theo',
                                    style:
                                    TextStyle(fontSize: 15, color: Colors.black),
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 10,
                              width: Get.width,
                              color: Colors.grey.withOpacity(0.2),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, top: 8,right: 8, bottom: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Đánh giá',
                                    style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                                  ),
                                  Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.5),
                                        borderRadius:BorderRadius.all(
                                            Radius.circular(8.0) //                 <--- border radius here
                                        )
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(child: Text('Đánh giá ngay',style: TextStyle(color: Colors.white),)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Chọn mua sản phẩn để là người đầu tiên đánh giá sản phẩm này'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sản phẩm liên quan',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),

                                ],
                              ),
                            ),
                            SizedBox(
                              height: Get.height *0.4,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data.data.relatedProducts.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: Get.width *0.6,
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
                                            (snapshot.data.data.relatedProducts[index].isPromotion != 0)?Row(
                                              children: [Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8, right: 8, left: 8),
                                                child: Container(
                                                  height: 30,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    color:Colors.redAccent,
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "${snapshot.data.data.relatedProducts[index].isPromotion}%",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              ],
                                            ):const SizedBox.shrink(),
                                            SizedBox(height: 5,),
                                            Image.network('$url${snapshot.data.data.relatedProducts[index].image}',
                                              height: Get.height * 0.2,
                                              width: Get.width * 0.6,
                                              fit: BoxFit.fill,
                                            ),
                                            Divider(),

                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                "${snapshot.data.data.relatedProducts[index].name}",maxLines: 2,
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
                                                "${NumberFormat('#,###', "vi_VN").format(snapshot.data.data.relatedProducts[index].price)}đ",
                                                style: TextStyle(
                                                  color: Colors.redAccent,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            )


                          ],
                        ),
                      ),
                    );
                  }
                  else
                    return Center(child: Text('Không có sản phẩm này'));
                  break;
                default:
                  return Container();
              }
            }),
        bottomNavigationBar:Container(
          height: 50,
          color: Colors.grey.withOpacity(0.2),
          child: Row(
            children: [
              Spacer(),
              Column(
                children: [
                  Icon(Icons.message),
                  Text('Chat ngay')
                ],
              ),
              Spacer(),
              VerticalDivider(),
              Column(
                children: [
                  Icon(Icons.shopping_cart),
                  Text('Thêm vào giỏ hàng')
                ],
              ),
              Spacer(),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: (){
                  print(numItems);
                  print(productID);
                  print(categoryId);
                  _productDetailBloc.addToCart( productID, numItems);
                },
                child: Container(
                  width: Get.width * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text('Mua ngay',style: TextStyle(color: Colors.white),)),
                  ),
                ),
              )
            ],
          ),
        )
);
  }

  SizedBox CustomButton({IconData icon, Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}
