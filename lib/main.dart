import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsg_api/api_provider.dart';
import 'package:gsg_api/screens/splach.dart';
import 'package:gsg_api/server.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ApiProvider>(
      create: (context) {
        return ApiProvider();
      },
      child: GetMaterialApp(
        home: MaterialApp(
          home: SplachScreen(),
        ),
      ),
    );
  }
}
