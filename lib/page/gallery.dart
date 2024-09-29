import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GalleryPickerScreen extends StatefulWidget {
  @override
  _GalleryPickerScreenState createState() => _GalleryPickerScreenState();
}

class _GalleryPickerScreenState extends State<GalleryPickerScreen> {
  late File? _image = null;

  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    getImage();
  }

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Image from Gallery'),
        backgroundColor: Color.fromARGB(255, 14, 177, 227),
      ),
      backgroundColor: Color.fromARGB(255, 151, 243, 243),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: _image == null
                    ? Text("กรุณาเลือกรูปภาพ")
                    : Image.file(_image!),
              ),

              
              SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: getImage,
                icon: Icon(Icons.photo_library),
                label: Text('เลือกภาพอีกครั้ง'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),


              SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.check),
                label: Text('ตรวจโรคเลย'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
     
    );
  }
}
