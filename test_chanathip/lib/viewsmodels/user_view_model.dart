import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:test_chanathip/constants/api.dart';
import 'package:test_chanathip/models/user_model.dart';

class UserViewModel extends ChangeNotifier {
  List<User> users = [];

  final Dio dio = Dio();

  Future<void> fetchData() async {
    try {
      final response = await dio.get(API.getUser);
      final List<dynamic> results = response.data['results'];
      users = results.map((data) => User.fromJson(data)).toList();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
