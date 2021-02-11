import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsg_api/screens/users.dart';
import 'package:gsg_api/server.dart';

class SplachScreen extends StatefulWidget {
  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllusersPerPage(1, Get.context);
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 0)).then(
        (value) => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) {
                return UsersScreen();
              },
            )));
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
