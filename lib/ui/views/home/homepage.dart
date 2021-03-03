import 'package:carousel_slider/carousel_slider.dart';
import 'package:code_demo/core/config/base_bloc.dart';
import 'package:code_demo/core/models/homemodel.dart';
import 'package:code_demo/ui/views/detail/detailui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:code_demo/core/config/local_variable.dart';
import 'package:get/get.dart';

import 'homebloc.dart';

class HomePageUI extends StatefulWidget {
  static const String ROUTER_NAME = '/HomePageUI';
  @override
  _HomePageUIState createState() => _HomePageUIState();
}

class _HomePageUIState extends State<HomePageUI> {
  int _current = 0;
  HomeBloc _homeBloc;
  HomeModel homeModel;
  final String url = LocalVariable.instance.urlAPI;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _homeBloc.getHome();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF3366FF),
                    const Color(0xFF00CCFF),
                  ])),
          height: 100.0,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Tìm kiếm trên T&T alarm',
                        contentPadding: EdgeInsets.all(0),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xFF00CCFF),
                        ),
                        alignLabelWithHint: true,
                        helperStyle: TextStyle(fontSize: 14),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          /*Corner*/
                          borderSide: BorderSide(
                            color: Colors.white, //The edge color is white
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white, //The border color is white
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            child: StreamBuilder(
                stream: _homeBloc.home.stream,
                builder: (context, snapshot) {
                  homeModel = snapshot.data;
                  switch (snapshot.connectionState) {
                    case ConnectionState.active:
                    case ConnectionState.done:
                      if(snapshot.hasData)
                        return Column(
                          children: [
                            // appbar
                            Column(children: [
                              Stack(
                                children: [
                                  CarouselSlider(
                                    items: homeModel.data.sliders
                                        .map((item) => Container(
                                      margin: EdgeInsets.all(5.0),
                                      child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.all(
                                              Radius.circular(
                                                  5.0)),
                                          child: Image.network(
                                            '$url${item.image}',fit: BoxFit.fill,
                                          )),
                                    ))
                                        .toList(),
                                    options: CarouselOptions(
                                        autoPlay: true,
                                        enlargeCenterPage: true,
                                        aspectRatio: 2.0,
                                        onPageChanged: (index, reason) {
                                          setState(() {
                                            _current = index;
                                          });
                                        }),
                                  ),
                                  Positioned(
                                      bottom: 0.0,
                                      left: 0.0,
                                      right: 0.0,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children:
                                        homeModel.data.sliders.map((url) {
                                          int index = homeModel.data.sliders
                                              .indexOf(url);
                                          return Container(
                                            width: 10.0,
                                            height: 10.0,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10.0,
                                                horizontal: 2.0),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 1),
                                              shape: BoxShape.circle,
                                              color: _current == index
                                                  ? Color(0xFF3366FF)
                                                  : Colors.grey,
                                            ),
                                          );
                                        }).toList(),
                                      ))
                                ],
                              ),
                            ]),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.security,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Dịch vụ cảnh báo',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 20),
                                )
                              ],
                            ),
                            SizedBox(
                              height: Get.width * 0.6,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: homeModel.data.services.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(8)),
                                              child: Image.network('$url${homeModel.data.services[index].image}',
                                                height: Get.height * 0.2,
                                                width: Get.width * 0.6,
                                                fit: BoxFit.fill,
                                              )),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(homeModel.data.services[index].title)
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Danh mục sản phẩm',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Xem tất cả',
                                        style:
                                        TextStyle(fontSize: 12, color: Colors.blue),
                                      ),
                                      Icon(
                                        Icons.arrow_right,
                                        color: Colors.blue,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            GridView.builder(
                              primary: false,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemCount: homeModel.data.categories.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: (){
                                      Get.toNamed(DetailUI
                                          .ROUTER_NAME, arguments: {'detail': homeModel.data.categories[index]});
                                    },
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(8)),
                                            child: Image.network('$url${homeModel.data.categories[index].image}'
                                              ,
                                              width: Get.width * 0.6,
                                            )),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text('${homeModel.data.categories[index].name}')
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                            //body
                          ],
                        );
                      else
                        return Container();
                      break;
                    default:
                      return Container();
                  }

                }
            ),
          ),
        ),
      ],
    );
  }
}
