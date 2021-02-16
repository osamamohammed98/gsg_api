import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsg_api/backend/api_provider.dart';
import 'package:gsg_api/backend/server.dart';
import 'package:gsg_api/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  GlobalKey<FormState> registerFormKey = GlobalKey();
  String radioValue = 'company';
  String fullName;
  String userName;
  String instegramAccount;
  String mobile;
  String email;
  String country;
  String city;
  String password;
  String confirmPassword;

  setFullName(String value) {
    this.fullName = value;
  }

  setUserName(String value) {
    this.userName = value;
  }

  setInstegramAccount(String value) {
    this.instegramAccount = value;
  }

  setMobile(String value) {
    this.mobile = value;
  }

  setEmail(String value) {
    this.email = value;
  }

  setCountry(String value) {
    this.country = value;
  }

  setCity(String value) {
    this.city = value;
  }

  setPassword(String value) {
    this.password = value;
  }

  setConfirmPassword(String value) {
    this.confirmPassword = value;
  }

  validateNullFunction(String val) {
    if (val.isEmpty) {
      return "null_error";
    }
    return null;
  }

  validateEmail(String value) {
    if (value.isEmpty) {
      return "null_error";
    }
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

  validateConformPassword(String value) {
    if (confirmPassword != password) {
      return 'passwords are not matched';
    }
  }

  saveForm() {
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();
      signUp(
          city: city,
          country: Provider.of<ApiProvider>(Get.context, listen: false)
              .selectedCountry,
          email: email,
          fullName: fullName,
          instegramAccount: instegramAccount,
          password: password,
          phone: mobile,
          role: 'user',
          userName: userName);
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
            key: registerFormKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MyTextField(
                    borderColor: Colors.black,
                    hintTextKey: 'UserName',
                    saveFunction: setUserName,
                    validateFunction: validateNullFunction,
                  ),
                  MyTextField(
                    borderColor: Colors.black,
                    hintTextKey: 'Email',
                    saveFunction: setEmail,
                    validateFunction: validateNullFunction,
                  ),
                  MyTextField(
                    borderColor: Colors.black,
                    hintTextKey: 'Password',
                    saveFunction: setPassword,
                    validateFunction: validatepasswordFunction,
                  ),
                  MyTextField(
                    borderColor: Colors.black,
                    hintTextKey: 'FullName',
                    saveFunction: setFullName,
                    validateFunction: validateNullFunction,
                  ),
                  MyTextField(
                    borderColor: Colors.black,
                    hintTextKey: 'instegram',
                    saveFunction: setInstegramAccount,
                    validateFunction: validateNullFunction,
                  ),
                  MyTextField(
                    borderColor: Colors.black,
                    hintTextKey: 'mobile',
                    inputType: TextInputType.number,
                    saveFunction: setMobile,
                    validateFunction: validateNullFunction,
                  ),
                  Selector<ApiProvider, String>(
                    builder: (context, value, child) {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.0),
                          borderRadius:
                              BorderRadius.all(new Radius.circular(10.0)),
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          underline: Container(),
                          value: value,
                          items: countries.map((e) {
                            return DropdownMenuItem<String>(
                              value: e,
                              child: Text(e),
                            );
                          }).toList(),
                          onChanged: (value) {
                            Provider.of<ApiProvider>(context, listen: false)
                                .selectCountry(value);
                          },
                        ),
                      );
                    },
                    selector: (x, y) {
                      return y.selectedCountry;
                    },
                  ),
                  MyTextField(
                    borderColor: Colors.black,
                    hintTextKey: 'City',
                    saveFunction: setCity,
                    validateFunction: validateNullFunction,
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
