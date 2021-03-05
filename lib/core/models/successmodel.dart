class SuccessModel {
  int code;
  String message;
  Data data;

  SuccessModel({this.code, this.message, this.data});

  SuccessModel.fromJson(Map<String, dynamic> json) {
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
  int cartTotal;
  bool result;

  Data({this.customerId, this.cartTotal, this.result});

  Data.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    cartTotal = json['cart_total'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['cart_total'] = this.cartTotal;
    data['result'] = this.result;
    return data;
  }
}
