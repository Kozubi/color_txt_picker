import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'controllers/color_txt_controller.dart';
import 'controllers/master_controller.dart';
import 'models/data_model.dart';

class SaveButtonWidget extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();
  SaveButtonWidget({
    Key? key,
    required this.masterController,
    required this.txtColorController,
  }) : super(key: key);

  final MasterController masterController;
  final TextColorController txtColorController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(children: [
                Container(
                  height: 200,
                  width: 250,
                  padding: EdgeInsets.all(35),
                  child: Column(
                    children: [
                      TextField(
                        controller: textEditingController,
                        decoration: InputDecoration(hintText: "Enter Name"),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: Text("Save"))
                    ],
                  ),
                ),
              ]);
            }).then((value) {
          if (value == null) {
            return getx.Get.snackbar(
                "Not Saved", "Use SAVE in popup to save data",
                backgroundColor: Colors.black,
                colorText: Colors.white,
                icon: Icon(
                  Icons.error_outline,
                  color: Colors.orange,
                ),
                snackPosition: getx.SnackPosition.BOTTOM);
          }
          if (textEditingController.text == "") {
            return getx.Get.snackbar("Not Saved", "Please enter a name",
                icon: Icon(
                  Icons.error_outline,
                  color: Colors.orange,
                ),
                backgroundColor: Colors.black,
                colorText: Colors.white,
                snackPosition: getx.SnackPosition.BOTTOM);
          }
          DataModel dataModel = DataModel(
              name: textEditingController.text,
              backgroundColorValue:
                  Colors.primaries.indexOf(masterController.choosedColor.value),
              fontTypeValue: masterController.fontValue.value,
              textColorValue: Colors.primaries
                  .indexOf(txtColorController.choosedColor.value),
              textSizeValue: masterController.sliderValue.value);
          masterController.listDataModel.value.add(dataModel);
        });
      },
      child: getx.Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Icon(
                  Icons.save,
                  color: masterController.choosedColor.value,
                ),
              ),
              Expanded(flex: 4, child: Text("SAVE"))
            ],
          )),
    );
  }
}
