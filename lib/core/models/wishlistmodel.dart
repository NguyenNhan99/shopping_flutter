class WishListModel {
  int code;
  String message;
  List<Data> data;

  WishListModel({this.code, this.message, this.data});

  WishListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int productId;
  int categoryId;
  int categoryParentId;
  String sku;
  String name;
  int price;
  int finalPrice;
  int isPromotion;
  int percentDiscount;
  String image;
  Null imagesUrl;
  int stock;
  int display;
  int ratingScore;
  int ratingCount;
  int quantity;
  int warranty;
  Null attachProduct;
  Null productDocument;

  Data(
      {this.productId,
        this.categoryId,
        this.categoryParentId,
        this.sku,
        this.name,
        this.price,
        this.finalPrice,
        this.isPromotion,
        this.percentDiscount,
        this.image,
        this.imagesUrl,
        this.stock,
        this.display,
        this.ratingScore,
        this.ratingCount,
        this.quantity,
        this.warranty,
        this.attachProduct,
        this.productDocument});

  Data.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    categoryId = json['category_id'];
    categoryParentId = json['category_parent_id'];
    sku = json['sku'];
    name = json['name'];
    price = json['price'];
    finalPrice = json['final_price'];
    isPromotion = json['is_promotion'];
    percentDiscount = json['percent_discount'];
    image = json['image'];
    imagesUrl = json['images_url'];
    stock = json['stock'];
    display = json['display'];
    ratingScore = json['rating_score'];
    ratingCount = json['rating_count'];
    quantity = json['quantity'];
    warranty = json['warranty'];
    attachProduct = json['attach_product'];
    productDocument = json['product_document'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['category_id'] = this.categoryId;
    data['category_parent_id'] = this.categoryParentId;
    data['sku'] = this.sku;
    data['name'] = this.name;
    data['price'] = this.price;
    data['final_price'] = this.finalPrice;
    data['is_promotion'] = this.isPromotion;
    data['percent_discount'] = this.percentDiscount;
    data['image'] = this.image;
    data['images_url'] = this.imagesUrl;
    data['stock'] = this.stock;
    data['display'] = this.display;
    data['rating_score'] = this.ratingScore;
    data['rating_count'] = this.ratingCount;
    data['quantity'] = this.quantity;
    data['warranty'] = this.warranty;
    data['attach_product'] = this.attachProduct;
    data['product_document'] = this.productDocument;
    return data;
  }
}
