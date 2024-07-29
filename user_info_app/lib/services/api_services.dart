import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:user_info_app/constants/constants.dart';
import 'package:user_info_app/model/user_model/user_model.dart';


Future<List<UserModel>> fetchUsersFromApi() async {
  final response = await http.get(Uri.parse(userUrl));

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = json.decode(response.body);
    List<dynamic> users = jsonResponse['users'];
    return users.map((data) => UserModel.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}
