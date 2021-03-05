class ProfileModel {
  int code;
  String message;
  Data data;

  ProfileModel({this.code, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int customerId;
  String name;
  String email;
  String avatarUrl;
  int roleId;
  int groupId;
  String shippingRegionId;
  String phone;

  Data(
      {this.customerId,
        this.name,
        this.email,
        this.avatarUrl,
        this.roleId,
        this.groupId,
        this.shippingRegionId,
        this.phone});

  Data.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    name = json['name'];
    email = json['email'];
    avatarUrl = json['avatar_url'];
    roleId = json['role_id'];
    groupId = json['group_id'];
    shippingRegionId = json['shipping_region_id'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['avatar_url'] = this.avatarUrl;
    data['role_id'] = this.roleId;
    data['group_id'] = this.groupId;
    data['shipping_region_id'] = this.shippingRegionId;
    data['phone'] = this.phone;
    return data;
  }
}
