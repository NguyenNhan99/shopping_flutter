import 'package:code_demo/core/config/base_bloc.dart';
import 'package:code_demo/core/models/profilemodel.dart';
import 'package:code_demo/ui/views/main_profile/mainprofilebloc.dart';
import 'package:code_demo/ui/views/order_list/orderlist.dart';
import 'package:code_demo/ui/views/profile_detail/profiledetail.dart';
import 'package:code_demo/ui/views/wish_list/wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainProfileUI extends StatefulWidget {
  static const String ROUTER_NAME = '/MainProfileUI';

  @override
  _MainProfileUIState createState() => _MainProfileUIState();
}

class _MainProfileUIState extends State<MainProfileUI> {
  MainProfileBloc _mainProfileBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mainProfileBloc = BlocProvider.of<MainProfileBloc>(context);
    _mainProfileBloc.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: _mainProfileBloc.profile.stream,
          builder: (context, AsyncSnapshot<ProfileModel> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
              case ConnectionState.done:
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.toNamed(ProfileDetailUI
                              .ROUTER_NAME,arguments: {'profile': snapshot.data});
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(children: [
                            SizedBox(
                              width: 40,
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.all(Radius.circular(
                                        50.0) //                 <--- border radius here
                                    ),
                              ),
                              child: Icon(
                                Icons.person_outline_rounded,
                                size: 100,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data.data.name,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(snapshot.data.data.email,
                                      style: TextStyle(color: Colors.grey))
                                ],
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_right,
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ]),
                        ),
                      ),
                      Divider(),
                      GestureDetector(
                        onTap: (){
                          Get.toNamed(OrderListUI
                              .ROUTER_NAME,);
                        },
                        child: Padding(
                          padding:
                          const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.settings_backup_restore,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Đơn hàng',
                                style: TextStyle(fontSize: 15, color: Colors.black),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_right,
                              ),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.security,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Dịch vụ cảnh báo',
                              style: TextStyle(fontSize: 15, color: Colors.black),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_right,
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.amp_stories_rounded,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Yêu cầu khảo sát và báo giá',
                              style: TextStyle(fontSize: 15, color: Colors.black),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_right,
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                      ),
                      Divider(),
                      GestureDetector(
                        onTap: (){
                          Get.toNamed(WishListUI
                              .ROUTER_NAME,);
                        },
                        child: Padding(
                          padding:
                          const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.local_florist,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Yêu thích của tôi',
                                style: TextStyle(fontSize: 15, color: Colors.black),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_right,
                              ),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.auto_fix_high,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Sản phẩm vừa xem',
                              style: TextStyle(fontSize: 15, color: Colors.black),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_right,
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.assignment_outlined,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Đánh giá dịch vụ',
                              style: TextStyle(fontSize: 15, color: Colors.black),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_right,
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                      ),
                      Divider(),

                    ],
                  );
                } else
                  return Container();
                break;
              default:
                return Container();
            }
          }),
    );
  }
}
