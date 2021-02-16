import 'package:ars_progress_dialog/ars_progress_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomeProgress {
  static ArsProgressDialog pr = ArsProgressDialog(Get.context,
      blur: 2,
      backgroundColor: Color(0x33000000),
      loadingWidget: Container(
        width: 100,
        height: 100,
        color: Colors.white,
        child: CupertinoActivityIndicator(),
      ));
}
