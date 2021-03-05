import 'package:code_demo/ui/views/home/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../bottombar.dart';

class CheckOutSuccessUI extends StatelessWidget {
  static const ROUTER_NAME = '/CheckOutSuccessUI';
  const CheckOutSuccessUI();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Đặt hàng'),centerTitle: true,),
      body: Center(
        child: Column(

          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.check_circle, color: Color(0xFF3366FF),size: 150,),
            ),
            Text('Đặt hàng thành công', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Cảm ơn quý khách đã đặt hàng. Nhân viên chúng tôi sẽ gọi lại để xác nhận đơn hàng', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
            ),
            Spacer(),
            ButtonTheme(
              minWidth: 300.0,
              height: 50.0,
              child: RaisedButton(
                onPressed: (){
                  Get.toNamed(BottomBar
                      .ROUTER_NAME,);

                },
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(8.0),
                ),

                color: Colors.blue,
                child: Text('Tiếp tục mua sắm',style: TextStyle(color: Colors.white),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonTheme(
                minWidth: 300.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: (){

                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(8.0),
                  ),

                  color: Colors.deepOrangeAccent,
                  child: Text('Theo giỏi đơn hàng',style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
