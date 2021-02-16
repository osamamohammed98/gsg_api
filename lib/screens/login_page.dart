import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsg_api/backend/api_provider.dart';
import 'package:gsg_api/backend/server.dart';
import 'package:gsg_api/utilities.dart/sp_helper.dart';
import 'package:gsg_api/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  GlobalKey<FormState> loginFormKey = GlobalKey();

  String mobile;
  String password;

  setMobile(String value) {
    this.mobile = value;
  }

  setPassword(String value) {
    this.password = value;
  }

  validatePhoneFunction(String val) {
    if (val.isEmpty) {
      return "null_error";
    } else if (!(val.length != 8 || val.length != 10)) {
      return "you have to enter 8 or 10 numbers for phone number";
    }
    return null;
  }

  validatepasswordFunction(String value) {
    if (value.isEmpty) {
      return '*reuired field';
    } else if (value.length < 6) {
      return 'password must be larger than 6 letters';
    }
  }

  saveForm() {
    if (loginFormKey.currentState.validate()) {
      loginFormKey.currentState.save();
      login(mobile, password);
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Form(
            key: loginFormKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MyTextField(
                    borderColor: Colors.black,
                    hintTextKey: 'mobile',
                    inputType: TextInputType.number,
                    saveFunction: setMobile,
                    validateFunction: validatePhoneFunction,
                  ),
                  MyTextField(
                    borderColor: Colors.black,
                    hintTextKey: 'Password',
                    saveFunction: setPassword,
                    validateFunction: validatepasswordFunction,
                  ),
                  RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text('Register'),
                      onPressed: () {
                        saveForm();
                      })
                ],
              ),
            )),
      ),
    );
  }
}
