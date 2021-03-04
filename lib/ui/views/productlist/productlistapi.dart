part of 'productlistbloc.dart';

@protected
Future<ProductListModel> getProductList(int id) async {
  final String url = LocalVariable.instance.urlAPI +
      '/api/product/category/$id';
  final String json = await HttpRequest.instance.getAsync(url);
  if (json == null) return null;
  final data = jsonDecode(json);
  return ProductListModel.fromJson(data);
}