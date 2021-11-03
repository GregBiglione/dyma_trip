import 'package:flutter/material.dart';

class ActivityFormImagePicker extends StatefulWidget {
  const ActivityFormImagePicker({Key? key}) : super(key: key);

  @override
  _ActivityFormImagePickerState createState() =>
      _ActivityFormImagePickerState();
}

class _ActivityFormImagePickerState extends State<ActivityFormImagePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.photo, color: Colors.black,),
            label: Text(
              "Galerie",
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.photo_camera, color: Colors.black,),
            label: Text(
              "Camera",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
