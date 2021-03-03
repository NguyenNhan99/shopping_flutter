class ProductDetailModel {
  int code;
  String message;
  Data data;

  ProductDetailModel({this.code, this.message, this.data});

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
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
  int ratingScore;
  int ratingCount;
  int quantity;
  List<RelatedProducts> relatedProducts;
  List<ProductInfoTabs> productInfoTabs;
  Ratings ratings;

  Data(
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
        this.relatedProducts,
        this.productInfoTabs,
        this.ratings});

  Data.fromJson(Map<String, dynamic> json) {
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
    if (json['related_products'] != null) {
      relatedProducts = new List<RelatedProducts>();
      json['related_products'].forEach((v) {
        relatedProducts.add(new RelatedProducts.fromJson(v));
      });
    }
    if (json['product_info_tabs'] != null) {
      productInfoTabs = new List<ProductInfoTabs>();
      json['product_info_tabs'].forEach((v) {
        productInfoTabs.add(new ProductInfoTabs.fromJson(v));
      });
    }
    ratings =
    json['ratings'] != null ? new Ratings.fromJson(json['ratings']) : null;
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
    // data['rating_score'] = this.ratingScore;
    data['rating_count'] = this.ratingCount;
    data['quantity'] = this.quantity;
    if (this.relatedProducts != null) {
      data['related_products'] =
          this.relatedProducts.map((v) => v.toJson()).toList();
    }
    if (this.productInfoTabs != null) {
      data['product_info_tabs'] =
          this.productInfoTabs.map((v) => v.toJson()).toList();
    }
    if (this.ratings != null) {
      data['ratings'] = this.ratings.toJson();
    }
    return data;
  }
}

class RelatedProducts {
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
  Null imagesUrl;
  int stock;
  int display;
  double ratingScore;
  int ratingCount;
  int quantity;
  int warranty;
  Null attachProduct;
  Null productDocument;

  RelatedProducts(
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

  RelatedProducts.fromJson(Map<String, dynamic> json) {
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
    imagesUrl = json['images_url'];
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
    // data['rating_score'] = this.ratingScore;
    data['rating_count'] = this.ratingCount;
    data['quantity'] = this.quantity;
    data['warranty'] = this.warranty;
    data['attach_product'] = this.attachProduct;
    data['product_document'] = this.productDocument;
    return data;
  }
}

class ProductInfoTabs {
  String type;
  String title;
  String value;
  // List<Null> attributesProduct;
  Null documentsProduct;
  Null attachProducts;

  ProductInfoTabs(
      {this.type,
        this.title,
        this.value,
        // this.attributesProduct,
        this.documentsProduct,
        this.attachProducts});

  ProductInfoTabs.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
    value = json['value'];
    // if (json['attributes_product'] != null) {
    //   attributesProduct = new List<Null>();
    //   json['attributes_product'].forEach((v) {
    //     attributesProduct.add(new Null.fromJson(v));
    //   });
    // }
    documentsProduct = json['documents_product'];
    // attachProducts = json['attach_products'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['title'] = this.title;
    data['value'] = this.value;
    // if (this.attributesProduct != null) {
    //   data['attributes_product'] =
    //       this.attributesProduct.map((v) => v.toJson()).toList();
    // }
    data['documents_product'] = this.documentsProduct;
    data['attach_products'] = this.attachProducts;
    return data;
  }
}

class Ratings {
  int ratingCount;
  double ratingScore;
  int rating5;
  int rating4;
  int rating3;
  int rating2;
  int rating1;
  List<LatestRating> latestRating;

  Ratings(
      {this.ratingCount,
        this.ratingScore,
        this.rating5,
        this.rating4,
        this.rating3,
        this.rating2,
        this.rating1,
        this.latestRating});

  Ratings.fromJson(Map<String, dynamic> json) {
    ratingCount = json['rating_count'];
    // ratingScore = json['rating_score'];
    rating5 = json['rating_5'];
    rating4 = json['rating_4'];
    rating3 = json['rating_3'];
    rating2 = json['rating_2'];
    rating1 = json['rating_1'];
    if (json['latest_rating'] != null) {
      latestRating = new List<LatestRating>();
      json['latest_rating'].forEach((v) {
        latestRating.add(new LatestRating.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating_count'] = this.ratingCount;
    data['rating_score'] = this.ratingScore;
    data['rating_5'] = this.rating5;
    data['rating_4'] = this.rating4;
    data['rating_3'] = this.rating3;
    data['rating_2'] = this.rating2;
    data['rating_1'] = this.rating1;
    if (this.latestRating != null) {
      data['latest_rating'] = this.latestRating.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LatestRating {
  int ratingId;
  int productId;
  int customerId;
  String customerName;
  String review;
  double rating;
  String createdAt;

  LatestRating(
      {this.ratingId,
        this.productId,
        this.customerId,
        this.customerName,
        this.review,
        this.rating,
        this.createdAt});

  LatestRating.fromJson(Map<String, dynamic> json) {
    ratingId = json['rating_id'];
    productId = json['product_id'];
    customerId = json['customer_id'];
    customerName = json['customer_name'];
    review = json['review'];
    // rating = json['rating'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating_id'] = this.ratingId;
    data['product_id'] = this.productId;
    data['customer_id'] = this.customerId;
    data['customer_name'] = this.customerName;
    data['review'] = this.review;
    data['rating'] = this.rating;
    data['created_at'] = this.createdAt;
    return data;
  }
}
