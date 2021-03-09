part of 'profiledetailbloc.dart';

@protected
Future<UpdateModel> updateProfileAPI(String hoten) async {
  final String url = LocalVariable.instance.urlAPI +
      '/api/user/profile/update';
  final Map<String, dynamic> parms = {
    'name': hoten
  };
  final String json = await HttpRequest.instance.putAsync(url, parms);
  if (json == null) return null;
  final data = jsonDecode(json);
  return UpdateModel.fromJson(data);
}