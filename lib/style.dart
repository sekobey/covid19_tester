import 'package:flutter/material.dart';

class AppStyle {
  BuildContext context;

  AppStyle(this.context);

  InputDecoration textFieldDecoration(
      {String labelText = "", String hintText = ""}) {
    var themeData = Theme.of(context);

    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.red[200]),
      labelText: labelText,
      labelStyle: TextStyle(color: themeData.accentColor),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: themeData.accentColor)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: themeData.accentColor)),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: themeData.accentColor)),
      focusColor: Colors.white,
      contentPadding: EdgeInsets.all(5),
    );
  }
}
