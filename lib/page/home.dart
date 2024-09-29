import 'package:flutter/material.dart';
//import 'package:test_final/page/add_pet.dart';
import 'package:skin2/page/camera.dart';
import 'package:skin2/page/gallery.dart';
//import 'package:test_final/page/viewpet.dart';
import 'package:camera/camera.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 151, 243, 243),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Image.asset(
                'images/doctor.jpg',
              ),
              SizedBox(height: 20),

              // ถ่ายรูปภาพ
              ElevatedButton.icon(
                onPressed: () async {
                  // Obtain a list of the available cameras on the device.
                  final cameras = await availableCameras();
                  // Get a specific camera from the list of available cameras.
                  final firstCamera = cameras.first;

                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CameraApp(camera: firstCamera)),
                  );
                },
                icon: Icon(Icons.photo_camera),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                ),
                label: Text(
                  'Take a picture',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 20),

              // เลือกรูปภาพ
              ElevatedButton.icon(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GalleryPickerScreen()),
                  );
                },
                icon: Icon(Icons.photo),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.orange,
                ),
                label: Text(
                  'Select from gallery',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
