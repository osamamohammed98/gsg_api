import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialoug {
  static showDialoug(String title, String content) {
    Get.defaultDialog(
      title: title,
      content: Text(content),
      confirm: Text(
        'OK',
        style: TextStyle(color: Colors.blue),
      ),
      onConfirm: () {
        Get.back();
      },
    );
  }
}
