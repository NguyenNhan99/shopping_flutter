part of 'orderdetailbloc.dart';

@protected
Future<OrderDetailModel> getOrderDetailAPI(int id) async {
  final String url = LocalVariable.instance.urlAPI +
      '/api/order/detail/$id';
  final String json = await HttpRequest.instance.getAsync(url);
  if (json == null) return null;
  final data = jsonDecode(json);
  return OrderDetailModel.fromJson(data);
}