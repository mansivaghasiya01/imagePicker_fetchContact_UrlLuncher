import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerView extends StatefulWidget {
  const ImagePickerView({
    Key? key,
  }) : super(key: key);

  @override
  State<ImagePickerView> createState() => _ImagePickerViewState();
}

class _ImagePickerViewState extends State<ImagePickerView> {
  //---------------------------- variable ------------------------
  XFile? selectImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: imagePickerView(),
    );
  }

  //------------------------------------------- function -------------------------------------

  Widget imagePickerView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () async {
              ImagePicker picker = ImagePicker(); //imagepicker class
              XFile? file = await picker.pickImage(
                source: ImageSource.camera,
              );
              //imagesource.camera => photo access in camera
              //imagesource.gallery => photo access in gallery

              if (file != null) {
                setState(() {
                  selectImage =
                      file; //assign camera selected image to select image
                });
                log("selected file"); //if condition true display this log
              } else {
                log("file not selected");
              }
            },
            child: const Text(
              "Select Image",
              style: TextStyle(
                fontSize: 19,
              ),
            ),
          ),
          if (selectImage != null) //if selectimage not null
            Image.file(
              File(selectImage!.path), //selectimage.path =>get image path
              height: 200,
              width: 200,
            ),
        ],
      ),
    );
  }
}
