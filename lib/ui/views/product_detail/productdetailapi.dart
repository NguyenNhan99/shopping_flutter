part of 'productdetailbloc.dart';

@protected
Future<ProductDetailModel> getProductDetail(int id) async {
  final String url = LocalVariable.instance.urlAPI +
      '/api/product/detail/$id';
  final String json = await HttpRequest.instance.getAsync(url);
  if (json == null) return null;
  final data = jsonDecode(json);
  return ProductDetailModel.fromJson(data);
}