import 'package:code_demo/core/config/local_variable.dart';
import 'package:code_demo/core/models/homemodel.dart';
import 'package:code_demo/ui/views/product_list/productlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailUI extends StatefulWidget {
  static const String ROUTER_NAME = '/DetailUI';
  const DetailUI();
  @override
  _DetailUIState createState() => _DetailUIState();
}

class _DetailUIState extends State<DetailUI> {
  Categories categories;
  final String url = LocalVariable.instance.urlAPI;
   String images;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final Map data = Map.from(Get.arguments);
    categories = data['detail'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categories.name),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
            itemCount: categories.subCategory.length,
            itemBuilder: (BuildContext context, int index) {
              if(!categories.subCategory[index].image.contains(url)){
                images = '$url${categories.subCategory[index].image}';
              }else{
                images = categories.subCategory[index].image;
              }
              return GestureDetector(
                onTap: (){
                  Get.toNamed(ProductListUI
                      .ROUTER_NAME, arguments: {'detailProduct': categories});
                },
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            print(categories.subCategory[index].image.contains(url));
                          },
                          child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              child: Image.network(images,
                                width: Get.width * 0.3,
                                height: Get.width * 0.3,
                              )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Text(
                            '${categories.subCategory[index].name},',
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                    const Divider(),
                  ],
                ),
              );
            })

      ),
    );
  }
}
