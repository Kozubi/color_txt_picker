import 'package:color_txt_picker/controllers/color_txt_controller.dart';
import 'package:color_txt_picker/controllers/master_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;

class ColorPicker extends StatelessWidget {
  dynamic controller;
  ColorPicker(this.controller);
  List<DropdownMenuItem<dynamic>> getItems(BuildContext context) {
    var r = Colors.primaries
        .map((e) => dropDownMenuItemBuilder(e, context))
        .toList();
    // r.insert(
    //     0,
    //     dropDownMenuItemBuilder(
    //         MaterialColor(0xffffff, {400: Color.fromRGBO(255, 255, 255, 1.0)}),
    //         context));
    return r;
  }

  DropdownMenuItem<MaterialColor> dropDownMenuItemBuilder(
      MaterialColor e, BuildContext context) {
    return DropdownMenuItem(
      key: Key(e.toString()),
      child: Container(
        padding: EdgeInsets.all(3),
        decoration:
            BoxDecoration(color: e, border: Border.all(color: Colors.black)),
        width: MediaQuery.of(context).size.width - 70,
        height: 30,
      ),
      value: e,
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return getx.Obx(() => Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white)),
          child: DropdownButton<dynamic>(
            underline: Container(
              color: Colors.transparent,
            ),
            items: getItems(context),
            isExpanded: false,
            value: controller.choosedColor.value,
            onTap: () {},
            onChanged: (var x) {
              controller.choosedColor.value = x;
            },
          ),
        ));
  }
}

class ColorPickerText extends ColorPicker {
  dynamic controller;
  ColorPickerText(this.controller) : super(null);
  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }
}
