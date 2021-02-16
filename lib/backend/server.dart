import 'dart:convert';

import 'package:get/get.dart';
import 'package:gsg_api/backend/api_provider.dart';
import 'package:gsg_api/models/comment.dart';
import 'package:gsg_api/models/product.dart';
import 'package:gsg_api/models/user.dart';
import 'package:gsg_api/screens/homePage.dart';
import 'package:gsg_api/utilities.dart/custom_dialoug.dart';
import 'package:gsg_api/utilities.dart/custom_progress.dart';
import 'package:gsg_api/utilities.dart/sp_helper.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

Set countries = {
  'Palestine',
  'Egypt',
  'Saudi',
  'Emarates',
  'Syria',
  'Palestine'
};
Logger logger = Logger();

String baseUrl = 'baseApi';
signUp(
    {String email,
    String password,
    String userName,
    String fullName,
    String phone,
    String country,
    String city,
    String instegramAccount,
    String role}) async {
  String url = '$baseUrl/user/signup';
  Map map = {
    "username": userName,
    "fullName": fullName,
    "email": email,
    "phone": phone,
    "password": password,
    "country": country,
    "city": city,
    "instagram": instegramAccount,
    "role": role,
    "language": "en"
  };
  try {
    CustomeProgress.pr.show();
    http.Response response = await http.post(url, body: map);
    Map responseMap = json.decode(response.body);
    CustomeProgress.pr.dismiss();
    logger.e(responseMap);
    SPHelper.spHelper.saveToken(responseMap['token']);
    User appUser = User.fromJson(responseMap['user']);
    Provider.of<ApiProvider>(Get.context, listen: false).setUserMap(appUser);
  } on Exception catch (e) {
    CustomeProgress.pr.dismiss();
    logger.e(e);
    CustomDialoug.showDialoug('Error', e.toString());
  }
}

getUserData(String token) async {
  String url = '$baseUrl/user';
  Map headerMap = {'Authorization': 'JWT $token'};
  try {
    http.Response response = await http.get(url, headers: {...headerMap});
    Map responseMap = json.decode(response.body);
    User appUser = User.fromJson(responseMap['user']);
    Provider.of<ApiProvider>(Get.context, listen: false).setUserMap(appUser);
    logger.e(response.body);
    Get.to(HomePage());
  } on Exception catch (e) {
    // TODO
  }
}

login(String phoneNumber, String password) async {
  String url = '$baseUrl/user/login';
  Map map = {"phone": phoneNumber, "password": password};
  try {
    CustomeProgress.pr.show();
    http.Response response = await http.post(url, body: map);
    Map responseMap = json.decode(response.body);
    CustomeProgress.pr.dismiss();
    logger.e(responseMap['user']['token']);
    SPHelper.spHelper.saveToken(responseMap['user']['token']);
    User appUser = User.fromJson(responseMap['user']);
    Provider.of<ApiProvider>(Get.context, listen: false).setUserMap(appUser);
    Get.to(HomePage());
  } on Exception catch (e) {
    CustomeProgress.pr.dismiss();
    logger.e(e);
    CustomDialoug.showDialoug('Error', e.toString());
  }
}

getAllProducts() async {
  String url = '$baseUrl/product/all';
  try {
    http.Response response = await http.get(url);
    Map responseMap = json.decode(response.body);
    List productsMap = responseMap['products'];
    List<Product> products =
        productsMap.map((e) => Product.fromJson(e)).toList();
    Provider.of<ApiProvider>(Get.context, listen: false).setProducts(products);
  } on Exception catch (e) {
    // TODO
  }
}

getProductCommentsAndLikes(String productId) async {
  String url = '$baseUrl/product/$productId';
  try {
    http.Response response = await http.get(url);
    Map responseMap = json.decode(response.body);
    String likesCount = responseMap['product']['likes']['count'].toString();
    List<Map> commentsMap = responseMap['product']['comments']['comments'];
    List<Comment> comments =
        commentsMap.map((e) => Comment.fromJson(e)).toList();
    Provider.of<ApiProvider>(Get.context, listen: false)
        .setProductComments(comments, likesCount);
  } on Exception catch (e) {
    // TODO
  }
}
