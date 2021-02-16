import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String hintTextKey;

  Function saveFunction;
  Function validateFunction;

  TextInputType inputType;
  String initValue;
  Color borderColor;
  MyTextField(
      {this.hintTextKey,
      this.saveFunction,
      this.validateFunction,
      this.inputType = TextInputType.text,
      this.borderColor,
      this.initValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.0),
        borderRadius: BorderRadius.all(new Radius.circular(10.0)),
      ),
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: TextFormField(
          initialValue: initValue ?? '',
          textInputAction: TextInputAction.next,
          keyboardType: inputType,
          decoration: InputDecoration(
            fillColor: Colors.grey[200],
            filled: true,
            alignLabelWithHint: true,
            labelText: hintTextKey,
            labelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: Colors.black.withOpacity(0.6)),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20)),
          ),
          validator: (value) {
            return validateFunction(value);
          },
          onSaved: (newValue) => saveFunction(newValue),
          onChanged: (value) => saveFunction(value),
        ),
      ),
    );
  }
}
