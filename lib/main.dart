import 'package:color_txt_picker/controllers/color_txt_controller.dart';
import 'package:color_txt_picker/font_picker.dart';
import 'package:color_txt_picker/models/data_model.dart';
import 'package:color_txt_picker/text_size_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_picker.dart' as color_picker;
import 'package:get/get.dart' as getx;
import 'dart:io' as io;
import 'package:permission_handler/permission_handler.dart' as perm;

import 'controllers/master_controller.dart';
import 'save_button_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return getx.GetMaterialApp(
      title: 'Google Font Viewer',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          backgroundColor: Colors.blueGrey[900]),
      home: MyHomePage(title: 'Google Font Viewer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<io.FileSystemEntity> dir;
  int currentIndex = 0;

  changeIndex(int i) {
    setState(() {
      currentIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    final masterController = getx.Get.put(MasterController());
    final txtColorController = getx.Get.put(TextColorController());

    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            title: Text(widget.title),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.list)),
              ],
            ),
          ),
          body: TabBarView(children: [
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - 125,
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                        flex: 4,
                        child: getx.Obx(() => Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(10),
                            color: masterController.mainColor.value,
                            // height: 100,
                            // width: 400,
                            child: getx.Obx(
                              () => Text(
                                  masterController.textCheckController.text,
                                  style: GoogleFonts.getFont(
                                      masterController
                                          .fn[masterController.fontValue.value],
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: txtColorController
                                              .mainColor.value,
                                          fontSize: masterController
                                              .sliderValue.value))),
                            )))),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(2),
                      child: TextField(
                        onEditingComplete: () {
                          FocusScope.of(context).unfocus();
                        },
                        onChanged: (String s) {
                          setState(() {});
                        },
                        controller: masterController.textCheckController,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.yellow)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            disabledBorder: InputBorder.none,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 10,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(10))),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )),
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.all(10),
                            height: 40,
                            child: color_picker.ColorPicker(masterController))),
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.all(10),
                            height: 40,
                            child: color_picker.ColorPickerText(
                                txtColorController))),
                    Expanded(
                      child: Container(child: TextSizeSlider()),
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                          // width: 300,
                          child: FontPicker(),
                        )),
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.all(5),
                      child: SaveButtonWidget(
                        text: masterController.textCheckController.text,
                        masterController: masterController,
                        txtColorController: txtColorController,
                      ),
                    ))
                  ],
                ),
              ),
            ),
            SavedList(
              changeIndex: changeIndex,
            )
          ])),
    );
  }
}

class SavedList extends StatelessWidget {
  final Function changeIndex;
  SavedList({required this.changeIndex});
  @override
  Widget build(BuildContext context) {
    MasterController masterController = getx.Get.find();
    return getx.Obx(() => ListView.builder(
        itemCount: masterController.listDataModel.value.length,
        itemBuilder: (BuildContext context, int index) {
          var fontValue = masterController.listDataModel[index].fontTypeValue;
          var backgroundColorValue =
              masterController.listDataModel[index].backgroundColorValue;
          var sliderValue = masterController.listDataModel[index].textSizeValue;
          var text = masterController.listDataModel[index].text;
          var l = GoogleFonts.asMap().keys.toList();
          var listOfCol = Colors.primaries;

          return Card(
              color: Colors.blueGrey,
              child: ListTile(
                onTap: () {
                  masterController.fontValue.value =
                      masterController.listDataModel[index].fontTypeValue;
                  masterController.mainColor.value =
                      Colors.primaries[backgroundColorValue];
                  masterController.sliderValue.value = sliderValue;
                  masterController.textCheckController.text = text;
                  DefaultTabController.of(context)!.animateTo(0);
                },
                leading: Text(masterController.listDataModel[index].name,
                    style: GoogleFonts.getFont(l[fontValue],
                        fontSize: 22, color: Colors.white)),
              ));
        }));
  }
}
