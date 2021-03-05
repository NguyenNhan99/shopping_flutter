part of 'mainprofilebloc.dart';

@protected
Future<ProfileModel> getProfileAPI() async {
  final String url = LocalVariable.instance.urlAPI +
      '/api/user/profile';
  final String json = await HttpRequest.instance.getAsync(url);
  if (json == null) return null;
  final data = jsonDecode(json);
  return ProfileModel.fromJson(data);
}
