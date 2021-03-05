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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Thông tin đơn hàng'),centerTitle: true,),
      body: Column(
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
                          text: 'Đơn hàng: ',
                          style: TextStyle(color: Colors.white),
                          children: <TextSpan>[
                            TextSpan(
                                text: '#16',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      RichText(
                        text: TextSpan(
                          text: 'Tổng tiền: ',
                          style: TextStyle(color: Colors.white),
                          children: <TextSpan>[
                            TextSpan(
                                text: '${NumberFormat('#,###', "vi_VN").format(160000)}đ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text('Hệ thống đang xử lý đơn hàng', style: TextStyle(color: Colors.white),),
                      SizedBox(height: 5,),
                      Text('2020-09-18 11:11:11', style: TextStyle(color: Colors.white),),

                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
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
                      SizedBox(height: 5,),
                      RichText(
                        text: TextSpan(
                          text: 'Tên: ',
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Trần Cao Vân',
                                style: TextStyle(
                                    color: Colors.black)),
                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      RichText(
                        text: TextSpan(
                          text: 'SDT: ',
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: '0123456789',
                                style: TextStyle(
                                    color: Colors.black)),
                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      RichText(
                        text: TextSpan(
                          text: 'Điạ chỉ: ',
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Trần Cao Vân',
                                style: TextStyle(
                                    color: Colors.black)),
                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: Get.height * 0.2,
            decoration: BoxDecoration(
              color: Colors.white,

            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: (){
                    //print(categories.subCategory[index].image.contains(url));
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: Image.network('https://trongnv.me/uploads/images/product/9-1-dau-do-chan-dong-may-atm-2-txdmj-xMfPi.jpg',
                        width: Get.width * 0.3,
                        height: Get.width * 0.3,
                      )),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Text(
                    'aaaaaaaaaaaaaaaaaaa',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ButtonTheme(
            minWidth: 300.0,
            height: 50.0,
            child: RaisedButton(
              onPressed: (){

              },
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(8.0),
              ),

              color: Colors.blue,
              child: Text('Theo dỏi đơn hàng',style: TextStyle(color: Colors.white),),
            ),
          ),

        ],
      ),
    );
  }
}
