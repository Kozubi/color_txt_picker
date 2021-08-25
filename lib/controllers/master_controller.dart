import 'package:color_txt_picker/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:google_fonts/google_fonts.dart' as fonts;
import 'dart:io' as io;

class MasterController extends getx.GetxController {
  dynamic choosedColor = Colors.primaries[0].obs;
  dynamic sliderValue = 16.toDouble().obs;
  dynamic fontValue = 1.obs;

  List fn = fonts.GoogleFonts.asMap().keys.toList();
  dynamic listDataModel = [].obs;
  dynamic currentTab = 0.obs;
  // List fn = [
  //   'Alegreya',
  //   'Karma',
  //   'Lato',
  // ];
}
