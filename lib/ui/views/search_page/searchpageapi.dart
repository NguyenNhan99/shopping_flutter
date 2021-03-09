part of 'searchpagebloc.dart';

@protected
Future<SearchModel> getSearchAPI(String keySearch) async {
  final String url = LocalVariable.instance.urlAPI +
      '/api/product/search?q=$keySearch&p=1';
  final String json = await HttpRequest.instance.getAsync(url);
  if (json == null) return null;
  final data = jsonDecode(json);
  return SearchModel.fromJson(data);
}