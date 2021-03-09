class SearchModel {
  int code;
  String message;
  Data data;

  SearchModel({this.code, this.message, this.data});

  SearchModel.fromJson(Map<String, dynamic> json) {
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
  List<Products> products;

  Data({this.products});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int productId;
  int categoryId;
  int categoryParentId;
  String sku;
  String name;
  String description;
  int price;
  int finalPrice;
  int isPromotion;
  int percentDiscount;
  String image;
  List<String> imagesUrl;
  int stock;
  int display;
  double ratingScore;
  int ratingCount;
  int quantity;
  int warranty;
  Null attachProduct;
  Null productDocument;

  Products(
      {this.productId,
        this.categoryId,
        this.categoryParentId,
        this.sku,
        this.name,
        this.description,
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

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    categoryId = json['category_id'];
    categoryParentId = json['category_parent_id'];
    sku = json['sku'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    finalPrice = json['final_price'];
    isPromotion = json['is_promotion'];
    percentDiscount = json['percent_discount'];
    image = json['image'];
    imagesUrl = json['images_url'].cast<String>();
    stock = json['stock'];
    display = json['display'];
    // ratingScore = json['rating_score'];
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
    data['description'] = this.description;
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
