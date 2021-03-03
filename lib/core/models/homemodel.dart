class HomeModel {
  int code;
  String message;
  Data data;

  HomeModel({this.code, this.message, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
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
  List<Sliders> sliders;
  List<Sliders> services;
  List<Categories> categories;
  List<HighlightProducts> highlightProducts;
  List<HighlightProducts> promotionProducts;

  Data(
      {this.sliders,
        this.services,
        this.categories,
        this.highlightProducts,
        this.promotionProducts});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['sliders'] != null) {
      sliders = new List<Sliders>();
      json['sliders'].forEach((v) {
        sliders.add(new Sliders.fromJson(v));
      });
    }
    if (json['services'] != null) {
      services = new List<Sliders>();
      json['services'].forEach((v) {
        services.add(new Sliders.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
    if (json['highlight_products'] != null) {
      highlightProducts = new List<HighlightProducts>();
      json['highlight_products'].forEach((v) {
        highlightProducts.add(new HighlightProducts.fromJson(v));
      });
    }
    if (json['promotion_products'] != null) {
      promotionProducts = new List<HighlightProducts>();
      json['promotion_products'].forEach((v) {
        promotionProducts.add(new HighlightProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sliders != null) {
      data['sliders'] = this.sliders.map((v) => v.toJson()).toList();
    }
    if (this.services != null) {
      data['services'] = this.services.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    if (this.highlightProducts != null) {
      data['highlight_products'] =
          this.highlightProducts.map((v) => v.toJson()).toList();
    }
    if (this.promotionProducts != null) {
      data['promotion_products'] =
          this.promotionProducts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sliders {
  int id;
  String url;
  String image;
  String imageMobile;
  String title;
  int type;
  int status;

  Sliders(
      {this.id,
        this.url,
        this.image,
        this.imageMobile,
        this.title,
        this.type,
        this.status});

  Sliders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    image = json['image'];
    imageMobile = json['image_mobile'];
    title = json['title'];
    type = json['type'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['image'] = this.image;
    data['image_mobile'] = this.imageMobile;
    data['title'] = this.title;
    data['type'] = this.type;
    data['status'] = this.status;
    return data;
  }
}

class Categories {
  int categoryId;
  String name;
  String description;
  String image;
  int parentId;
  int isDeleted;
  int position;
  List<SubCategory> subCategory;

  Categories(
      {this.categoryId,
        this.name,
        this.description,
        this.image,
        this.parentId,
        this.isDeleted,
        this.position,
        this.subCategory});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    parentId = json['parent_id'];
    isDeleted = json['is_deleted'];
    position = json['position'];
    if (json['sub_category'] != null) {
      subCategory = new List<SubCategory>();
      json['sub_category'].forEach((v) {
        subCategory.add(new SubCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['parent_id'] = this.parentId;
    data['is_deleted'] = this.isDeleted;
    data['position'] = this.position;
    if (this.subCategory != null) {
      data['sub_category'] = this.subCategory.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategory {
  int categoryId;
  String name;
  String description;
  String image;
  int parentId;
  int isDeleted;
  int position;
  Null subCategory;

  SubCategory(
      {this.categoryId,
        this.name,
        this.description,
        this.image,
        this.parentId,
        this.isDeleted,
        this.position,
        this.subCategory});

  SubCategory.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    parentId = json['parent_id'];
    isDeleted = json['is_deleted'];
    position = json['position'];
    subCategory = json['sub_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['parent_id'] = this.parentId;
    data['is_deleted'] = this.isDeleted;
    data['position'] = this.position;
    data['sub_category'] = this.subCategory;
    return data;
  }
}

class HighlightProducts {
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
  int ratingScore;
  int ratingCount;
  int quantity;
  int warranty;
  Null attachProduct;
  Null productDocument;

  HighlightProducts(
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

  HighlightProducts.fromJson(Map<String, dynamic> json) {
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