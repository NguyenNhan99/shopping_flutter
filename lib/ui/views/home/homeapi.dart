part of 'homebloc.dart';

@protected
Future<HomeModel> getHomeAPI() async {
  final String url = LocalVariable.instance.urlAPI +
      '/api/home';
  final String json = await HttpRequest.instance.getAsync(url);
  if (json == null) return null;
  final data = jsonDecode(json);
  return HomeModel.fromJson(data);
}