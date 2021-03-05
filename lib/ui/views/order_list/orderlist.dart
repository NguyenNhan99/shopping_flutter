import 'package:code_demo/ui/views/order_detail/orderdetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderListUI extends StatefulWidget {
  static const String ROUTER_NAME = '/OrderListUI';
  @override
  _OrderListUIState createState() => _OrderListUIState();
}

class _OrderListUIState extends State<OrderListUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Đơn hàng'),centerTitle: true,),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: (){
                      Get.toNamed(OrderDetailUI
                          .ROUTER_NAME);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: Get.height * 0.15,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(
                              5.0) //                 <--- border radius here
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.book,
                                size: 20,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Đơn hàng: ',
                                      style: TextStyle(color: Colors.grey),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '#16',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF3366FF))),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Tổng tiền: ',
                                      style: TextStyle(color: Colors.grey),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '${NumberFormat('#,###', "vi_VN").format(160000)}đ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Text('2020-09-18 11:11:11', style: TextStyle(color: Colors.grey),),
                                  SizedBox(height: 5,),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Trạng thái: ',
                                      style: TextStyle(color: Colors.grey),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'API chết rồi',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.arrow_right,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
