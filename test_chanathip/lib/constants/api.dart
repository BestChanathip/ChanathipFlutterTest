// ignore_for_file: unnecessary_brace_in_string_interps

class API {
  static const String baseURL = 'https://randomuser.me/api/';
  static const String postfix = '?results=10';
  static const String getUser = '${baseURL}${postfix}';
}
