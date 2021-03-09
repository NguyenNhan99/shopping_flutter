class OrderDetailModel {
  int code;
  String message;
  Data data;

  OrderDetailModel({this.code, this.message, this.data});

  OrderDetailModel.fromJson(Map<String, dynamic> json) {
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
  int orderId;
  int customerId;
  int totalQuantity;
  int status;
  String createdAt;
  String comments;
  String name;
  String phone;
  String address;
  String invoiceAddress;
  int feeShip;
  List<Products> products;

  Data(
      {this.orderId,
        this.customerId,
        this.totalQuantity,
        this.status,
        this.createdAt,
        this.comments,
        this.name,
        this.phone,
        this.address,
        this.invoiceAddress,
        this.feeShip,
        this.products});

  Data.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    customerId = json['customer_id'];
    totalQuantity = json['total_quantity'];
    status = json['status'];
    createdAt = json['created_at'];
    comments = json['comments'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    invoiceAddress = json['invoice_address'];
    feeShip = json['fee_ship'];
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['customer_id'] = this.customerId;
    data['total_quantity'] = this.totalQuantity;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['comments'] = this.comments;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['invoice_address'] = this.invoiceAddress;
    data['fee_ship'] = this.feeShip;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int productId;
  String name;
  String image;
  String attributes;
  int quantity;
  int price;
  int totalPrice;

  Products(
      {this.productId,
        this.name,
        this.image,
        this.attributes,
        this.quantity,
        this.price,
        this.totalPrice});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    name = json['name'];
    image = json['image'];
    attributes = json['attributes'];
    quantity = json['quantity'];
    price = json['price'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['attributes'] = this.attributes;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['total_price'] = this.totalPrice;
    return data;
  }
}
