import 'package:color_txt_picker/controllers/color_txt_controller.dart';
import 'package:color_txt_picker/controllers/master_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:google_fonts/google_fonts.dart' as fonts;
import 'dart:io' as io;

class FontPicker extends StatelessWidget {
  dynamic fontList = [
    fonts.GoogleFonts.aBeeZee(),
    fonts.GoogleFonts.abel(),
  ];

  List<DropdownMenuItem<dynamic>> getList(MasterController controller) {
    // var xx = fonts.GoogleFonts.asMap().keys.toList();
    // var d = controller.fn
    var d = controller.fn
        .map((e) => DropdownMenuItem(
              child: FittedBox(
                child: Container(
                  child: Text(
                    e,
                    softWrap: true,
                    // style: e(
                    //   color: Colors.white,
                    // )
                  ),
                ),
              ),
              value: controller.fn.indexOf(e),
            ))
        .toList();
    return d;
  }

  @override
  Widget build(BuildContext context) {
    // dir;
    MasterController masterController = getx.Get.find();
    TextColorController textColorController = getx.Get.find();
    var data = getList(masterController);
    // TODO: implement build
    return getx.Obx(() => Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 1,
                child: IconButton(
                    color: textColorController.mainColor.value,
                    onPressed: () {
                      if (masterController.fontValue.value == 0) {
                        return;
                      }
                      masterController.fontValue.value--;
                    },
                    icon: Icon(Icons.skip_previous))),
            Expanded(
              flex: 8,
              child: Container(
                padding: EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: DropdownButton<dynamic>(
                    dropdownColor: Colors.grey,
                    value: masterController.fontValue.value,
                    onChanged: (dynamic x) {
                      masterController.fontValue.value = x;
                    },
                    underline: Container(
                      color: Colors.transparent,
                    ),
                    items: data),
              ),
            ),
            Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    masterController.fontValue.value++;
                  },
                  icon: Icon(Icons.skip_next),
                  color: textColorController.mainColor.value,
                )),
          ],
        ));
  }
}
