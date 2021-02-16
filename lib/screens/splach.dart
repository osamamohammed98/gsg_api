import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsg_api/screens/homePage.dart';
import 'package:gsg_api/screens/login_page.dart';
import 'package:gsg_api/screens/register_page.dart';
import 'package:gsg_api/backend/server.dart';
import 'package:gsg_api/utilities.dart/sp_helper.dart';

class SplachScreen extends StatefulWidget {
  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  String token;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    token = SPHelper.spHelper.getToken();
    getAllProducts();
    if (token != null) {
      getUserData(token);
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value) {
      if (token == null) {
        Get.to(LoginPage());
      } else {
        Get.to(HomePage());
      }
    });
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 100,
        ),
      ),
    );
  }
}
