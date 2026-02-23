import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'image_provider.dart';

class ImagePickerView extends StatelessWidget {
  const ImagePickerView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ImagePickerProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Image Picker with Provider")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            provider.imageFile != null
                ? Image.file(
              provider.imageFile!,
              height: 200,
            )
                : const SizedBox(),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                provider.pickFromGallery();
              },
              child: const Text("Pick From Gallery"),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                provider.pickFromCamera();
              },
              child: const Text("Pick From Camera"),
            ),
          ],
        ),
      ),
    );
  }
}