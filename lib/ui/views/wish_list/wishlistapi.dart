part of 'wishlistbloc.dart';

@protected
Future<WishListModel> getWishListAPI() async {
  final String url = LocalVariable.instance.urlAPI +
      '/api/product/wishlist';
  final String json = await HttpRequest.instance.getAsync(url);
  if (json == null) return null;
  final data = jsonDecode(json);
  return WishListModel.fromJson(data);
}