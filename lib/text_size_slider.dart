import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;

import 'controllers/master_controller.dart';

class TextSizeSlider extends StatelessWidget {
  const TextSizeSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MasterController masterController = getx.Get.find();
    return getx.Obx(() => Slider(
        value: masterController.sliderValue.value,
        onChanged: (var x) {
          masterController.sliderValue.value = x;
        },
        activeColor: Colors.red,
        divisions: 90,
        min: 10,
        max: 100));
  }
}
