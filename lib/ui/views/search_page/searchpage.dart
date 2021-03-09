import 'package:code_demo/core/config/base_bloc.dart';
import 'package:code_demo/ui/views/search_page/searchpagebloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPageUI extends StatefulWidget {
  static const String ROUTER_NAME = '/SearchPageUI';
  @override
  _SearchPageUIState createState() => _SearchPageUIState();
}

class _SearchPageUIState extends State<SearchPageUI> {
  SearchPageBloc _searchPageBloc;
  final _controller = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchPageBloc = BlocProvider.of<SearchPageBloc>(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tìm kiếm'),centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white),
              child: TextField(
                controller: _controller,
                onSubmitted: (value) {
                  _controller.clear();
                  _searchPageBloc.getSearch(value);
                },
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm sản phầm',
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
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text('Tìm kiếm gần đây', style: TextStyle(color: Colors.grey),),
          ),
          SizedBox(
            height: 50,
            child: StreamBuilder(
                stream: _searchPageBloc.searchPage.stream,
                builder: (context, AsyncSnapshot<List<String>> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.active:
                    case ConnectionState.done:
                      if (snapshot.hasData)
                        return  ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration:BoxDecoration(
                                    color: Colors.grey.withOpacity(0.5),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0) //                 <--- border radius here
                                    ),
                                  ), //             <--- BoxDecoration here
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        snapshot.data[index],
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      else
                        return Center(child: Text('Không có sản phẩm này'));
                      break;
                    default:
                      return Container();
                  }

                }
            ),
          )
        ],
      ),
    );
  }
}
