import 'package:flutter/cupertino.dart';

class DataModel {
  String name;
  String text;
  int backgroundColorValue;
  int textColorValue;
  double textSizeValue;
  int fontTypeValue;

  DataModel(
      {required this.name,
      required this.text,
      required this.backgroundColorValue,
      required this.textColorValue,
      required this.textSizeValue,
      required this.fontTypeValue});

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "text": text,
      "backgroundColorValue": backgroundColorValue,
      "textColorValue": textColorValue,
      "textSizeValue": textSizeValue,
      "fontTypeValue": fontTypeValue,
    };
  }

  DataModel fromMap(Map<String, dynamic> data) {
    return DataModel(
        name: data['name'] ?? "No Name",
        text: data['text'] ?? "Default TEXT 123",
        backgroundColorValue: data['backgroundColorValue'] ?? 0,
        textColorValue: data['textColorValue'] ?? 0,
        textSizeValue: data['textSizeValue'] ?? 0,
        fontTypeValue: data['fontTypeValue'] ?? 0);
  }
}
