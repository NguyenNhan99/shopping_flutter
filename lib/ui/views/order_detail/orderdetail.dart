import 'package:code_demo/core/config/base_bloc.dart';
import 'package:code_demo/core/models/orderdetailmodel.dart';
import 'package:code_demo/ui/views/order_detail/orderdetailbloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderDetailUI extends StatefulWidget {
  static const String ROUTER_NAME = '/OrderDetailUI';
  @override
  _OrderDetailUIState createState() => _OrderDetailUIState();
}

class _OrderDetailUIState extends State<OrderDetailUI> {
  OrderDetailBloc _orderDetailBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _orderDetailBloc = BlocProvider.of<OrderDetailBloc>(context);
    //Api man hinh truoc k sai dc nen hardcode
    _orderDetailBloc.getOrderDetail(30);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin đơn hàng'),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: _orderDetailBloc.orderDetail.stream,
          builder: (context, AsyncSnapshot<OrderDetailModel> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
              case ConnectionState.done:
                if (snapshot.hasData) {
                  return Column(

                    children: [
                      Container(
                        height: Get.height * 0.15,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.book,
                                size: 20,
                                color: Colors.red,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Mã đơn hàng: ',
                                      style: TextStyle(color: Colors.white),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text:
                                                '#${snapshot.data.data.orderId}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Trạng thái: Đang xử lý',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Hệ thống đang xử lý đơn hàng',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${snapshot.data.data.createdAt}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: Get.height * 0.15,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.location_on_rounded,
                                size: 20,
                                color: Colors.green,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Thông tin nhận hàng'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Tên: ',
                                      style: TextStyle(color: Colors.black),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '${snapshot.data.data.name}',
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'SDT: ',
                                      style: TextStyle(color: Colors.black),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '${snapshot.data.data.phone}',
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Điạ chỉ: ',
                                      style: TextStyle(color: Colors.black),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '${snapshot.data.data.address}',
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: Get.height * 0.15,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(

                          children: [
                            GestureDetector(
                              onTap: () {
                                //print(categories.subCategory[index].image.contains(url));
                              },
                              child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  child: Image.network(
                                    'https://trongnv.me/${snapshot.data.data.products[0].image}',
                                    width: Get.width * 0.3,
                                    height: Get.width * 0.3,
                                  )),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                      '${snapshot.data.data.products[0].name}'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${NumberFormat('#,###', "vi_VN").format(snapshot.data.data.products[0].price)}đ",
                                        style: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text('SL: ${snapshot.data.data.products[0].quantity}'),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Phí vận chuyển'),
                            Text('0đ'),
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Tổng thanh toán'),
                            Text(
                              "${NumberFormat('#,###', "vi_VN").format(snapshot.data.data.products[0].price)}đ",
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 250,
                        height: 50,
                        decoration:BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(
                              Radius.circular(5.0) //                 <--- border radius here
                          ),
                        ) ,
                        child: Center(
                          child: Text(
                            'Theo dỏi đơn hàng',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  );
                } else
                  return Center(child: Text('Không có sản phẩm này'));
                break;
              default:
                return Container();
            }
          }),
    );
  }
}
