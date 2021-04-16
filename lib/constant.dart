import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFBDE8FF);
const kAccentColor = Color(0xFF26547D);

const kAddUserTextInputDecoration = InputDecoration(
  hintText: 'Default Text',
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(width: 1.0, color: kAccentColor),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(width: 2.0, color: kAccentColor),
  ),
  contentPadding: EdgeInsets.all(12.0),
  errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(width: 1.0, color: Colors.red)),
  focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(width: 2.0, color: Colors.red)),
);
