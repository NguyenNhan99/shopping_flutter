import 'package:code_demo/core/config/base_bloc.dart';
import 'package:code_demo/core/config/local_variable.dart';
import 'package:code_demo/core/models/wishlistmodel.dart';
import 'package:code_demo/ui/views/product_detail/productdetail.dart';
import 'package:code_demo/ui/views/wish_list/wishlistbloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class WishListUI extends StatefulWidget {
  static const String ROUTER_NAME = '/WishListUI';
  @override
  _WishListUIState createState() => _WishListUIState();
}

class _WishListUIState extends State<WishListUI> {
  final String url = LocalVariable.instance.urlAPI;
  WishListBloc _wishListBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _wishListBloc = BlocProvider.of<WishListBloc>(context);
    _wishListBloc.getWistList();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kMinInteractiveDimension - 120) / 2;
    final double itemWidth = size.width / 1.6;
    return Scaffold(
      appBar: AppBar(title: Text('Yêu thích của tôi'),centerTitle: true,),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
                stream: _wishListBloc.wishlist.stream,
                builder: (context, AsyncSnapshot<WishListModel> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.active:
                    case ConnectionState.done:
                      if (snapshot.hasData)
                        return GridView.builder(
                          primary: false,
                          padding: EdgeInsets.zero,
                          itemCount: snapshot.data.data.length,
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: (itemWidth / itemHeight)),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(ProductDetailUI
                                      .ROUTER_NAME, arguments: {'detailProduct': snapshot.data.data[index].categoryId});
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
                                      (snapshot.data.data[index].isPromotion != 0)?Container(
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
                                          '$url${snapshot.data.data[index].image}',
                                          width: 150,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '${snapshot.data.data[index].name}',maxLines: 2,
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
                                          "${NumberFormat('#,###', "vi_VN").format(snapshot.data.data[index].price)}đ",
                                          style: TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),

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
}
