part of 'productdetailbloc.dart';

@protected
Future<ProductDetailModel> getProductDetailAPI(int id) async {
  final String url = LocalVariable.instance.urlAPI +
      '/api/product/detail/$id';
  final String json = await HttpRequest.instance.getAsync(url);
  if (json == null) return null;
  final data = jsonDecode(json);
  return ProductDetailModel.fromJson(data);
}

@protected
Future<SuccessModel> addToCartAPI(int productId, int quantity) async {
  final String url = LocalVariable.instance.urlAPI +
      '/api/cart/add';

  final Map<String, dynamic> parms = {
    'product_id': productId,
    'quantity': quantity
  };

  final String json = await HttpRequest.instance.postAsync(url,parms);
  if (json == null) return null;
  final data = jsonDecode(json);
  return SuccessModel.fromJson(data);
}