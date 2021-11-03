import 'dart:io';

import 'package:dyma_trip/provider/city_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ActivityFormImagePicker extends StatefulWidget {
  final Function updateUrl;

  const ActivityFormImagePicker({Key? key, required this.updateUrl}) : super(key: key);

  @override
  _ActivityFormImagePickerState createState() =>
      _ActivityFormImagePickerState();
}

class _ActivityFormImagePickerState extends State<ActivityFormImagePicker> {
  final ImagePicker imagePicker = ImagePicker();
  File? _deviceImage;

  //----------------------------------------------------------------------------
  //----------------------- Pick image from gallery or camera ------------------
  //----------------------------------------------------------------------------

  Future<void> _pickImage(ImageSource source) async {
    try {
      XFile? pickedFile = await imagePicker.pickImage(source: source);
      _deviceImage = File(pickedFile!.path);
      if(_deviceImage !=  null){
        final url = await Provider.of<CityProvider>(context, listen: false).uploadImage(_deviceImage!);
        print("url final $url");
        widget.updateUrl(url);
        setState(() {});
        print("Image ok");
      }
      else{
        print("No image");
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () => _pickImage(ImageSource.gallery),
                icon: Icon(Icons.photo, color: Colors.black,),
                label: Text(
                  "Galerie",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton.icon(
                onPressed: () => _pickImage(ImageSource.camera),
                icon: Icon(Icons.photo_camera, color: Colors.black,),
                label: Text(
                  "Camera",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            child: _deviceImage != null ? Image.file(_deviceImage!) : Text("Aucune image"),
          ),
        ],
      ),
    );
  }
}
