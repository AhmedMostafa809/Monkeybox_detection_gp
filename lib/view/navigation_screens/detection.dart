import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monkeybox_final/utilities/app_colors.dart';
import 'package:tflite/tflite.dart';
import 'package:sizer/sizer.dart';

class detectionScreen extends StatefulWidget {
  @override
  State<detectionScreen> createState() => _detectionScreenState();
}

bool _loading = true;
File? _image;
List? _output;
final picker = ImagePicker();

class _detectionScreenState extends State<detectionScreen> {
  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
    );
    setState(() {
      _output = output;
      _loading = false;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/converted_model.tflite", labels: "assets/labels.txt");
  }

  pickImageFromGallery() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image!);
  }

  pickImageFromCamera() async {
    var image = await picker.getImage(source: ImageSource.camera);
    if (image == null) return null;
    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Text("Upload your photo",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp)),
            SizedBox(
              height: 3.h,
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: clr.backGround,
                  borderRadius: BorderRadius.circular(30),


                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Center(
                          child: _loading == true
                              ? const SizedBox() //show nothing if no picture selected
                              : Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image.file(
                                        _image!,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    _output != null
                                        ? Padding(
                                            padding: EdgeInsets.all(8.0.sp),
                                            child: Text(
                                              'The object is: ${_output![0]['label']}!',
                                              style: TextStyle(
                                                  color: clr.primaryColor,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        : Container(),
                                  ],
                                ),
                        ),
                      ),
                    ])),
          ])),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        backgroundColor: clr.primaryColor,
        activeBackgroundColor: Colors.deepPurpleAccent,
        //background color when menu is expanded
        visible: true,
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,

        elevation: 8.0,
        //shadow elevation of button

        children: [
          SpeedDialChild(
              child: Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
              ),
              backgroundColor: clr.lightRed,
              label: 'Add from camera',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: pickImageFromCamera),
          SpeedDialChild(
            child: Icon(Icons.image, color: Colors.white),
            backgroundColor: clr.lightBlue,
            label: 'Add from gallery',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: pickImageFromGallery,
          ),
        ],
      ),
    );
  }
}
