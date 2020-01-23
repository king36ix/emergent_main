import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.teal, width: 1.2),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 4.0),
  ),
  hintStyle: TextStyle(color: Colors.teal),
//  labelText: 'Email Address',
//  hintText: 'Enter emails.g examplemail@gmail.com',
  focusColor: Colors.deepOrange,
//  border: OutlineInputBorder (borderRadius: constBorderRadius.circular(4.5)),
);
