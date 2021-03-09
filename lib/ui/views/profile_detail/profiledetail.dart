import 'package:code_demo/core/config/base_bloc.dart';
import 'package:code_demo/core/models/profilemodel.dart';
import 'package:code_demo/ui/views/profile_detail/profiledetailbloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileDetailUI extends StatefulWidget {
  static const String ROUTER_NAME = '/ProfileDetailUI';
  @override
  _ProfileDetailUIState createState() => _ProfileDetailUIState();
}

class _ProfileDetailUIState extends State<ProfileDetailUI> {
  ProfileModel profileModel;
  ProfileDetailBloc _profileDetailBloc;

  final TextEditingController _hoTen = TextEditingController();
  final TextEditingController _sdt = TextEditingController();
  final TextEditingController _dc = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final Map data = Map.from(Get.arguments);
    profileModel = data['profile'];
    _profileDetailBloc = BlocProvider.of<ProfileDetailBloc>(context);
    _hoTen.text = profileModel.data.name;
    _sdt.text = profileModel.data.phone;
    _dc.text = profileModel.data.address1;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Thông tin tài khoản'),
      centerTitle: true,),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20,),
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
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child:TextField(
                  controller: _hoTen,
                  decoration: InputDecoration(
                      hintText: _hoTen.text,
                      labelText: 'Họ và tên',
                      hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
                      icon: Icon(Icons.person_outline_rounded)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child:TextField(
                  controller: _sdt,
                  decoration: InputDecoration(
                      hintText: _sdt.text,
                      labelText: 'Số điện thoại',
                      hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
                      icon: Icon(Icons.phone)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child:TextField(
                  controller: _dc,
                  decoration: InputDecoration(
                      hintText: _dc.text,
                      labelText: 'Địa chỉ',
                      hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
                      icon: Icon(Icons.home)
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.all(15),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.lock,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Đổi mật khẩu',
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(),
              ),
              Padding(
                padding:
                const EdgeInsets.all(15),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.exit_to_app_outlined,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Đăng xuất',
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(),
              ),
              GestureDetector(
                onTap: (){
                  _profileDetailBloc.updateProfile(_hoTen.text);
                },
                child: Container(
                  width: 250,
                  height: 50,
                  decoration:BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                        Radius.circular(5.0) //                 <--- border radius here
                    ),
                  ) ,
                  child: Center(
                    child: Text(
                      'Cập nhập',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}