

import 'package:flutter/material.dart';
import 'package:storage/imageupload/image_upload.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Storage Use"),
    ),
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){ 
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ImageUpload(),
                  ),
                );
              },
              child: const Text("Upload Image"),
            ),
            ElevatedButton(
              onPressed: (){ 
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ImageUpload(),
                  ),
                );
              },
              child: const Text("Show Uploads"),
            ),
          ],
        ),
      ),
    ),
    );
  }
}