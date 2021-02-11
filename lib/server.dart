import 'dart:convert';

import 'package:get/get.dart';
import 'package:gsg_api/api_provider.dart';
import 'package:gsg_api/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

String baseUrl = 'https://reqres.in/api';
getAllusersPerPage(int pageNumber, context) async {
  try {
    String url = baseUrl + '/users?page=$pageNumber';
    http.Response response = await http.get(url);

    Map map = json.decode(response.body);
    List usersMaps = map['data'];
    List<User> users = usersMaps.map((e) => User.fromJson(e)).toList();
    Provider.of<ApiProvider>(context, listen: false).setUsers(users);
  } on Exception catch (e) {
    print('error');
  }
}

getOneUserFromApi(int userid) async {
  try {
    Provider.of<ApiProvider>(Get.context, listen: false).clearSelectedUser();
    String url = baseUrl + '/users/$userid';
    http.Response response = await http.get(url);
    Map userMap = json.decode(response.body)['data'];
    User user = User.fromJson(userMap);
    Provider.of<ApiProvider>(Get.context, listen: false).setSelectedUser(user);
  } on Exception catch (e) {
    // TODO
  }
}

createUser(String userName, String userJob) async {
  String url = baseUrl + '/users';
  Map parameterMap = {"name": userName, "job": userJob};
  http.Response response = await http.post(url, body: parameterMap);
  print(response.body);
}

registerUser(String email, String password) async {
  String url = baseUrl + '/register';
  Map parameterMap = {"email": "eve.holt@reqres.in", "password": "pistol"};
  http.Response response = await http.post(url, body: parameterMap);
  print(response.body);
}
