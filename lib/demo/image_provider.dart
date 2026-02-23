import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerProvider extends ChangeNotifier {
  final ImagePicker _picker = ImagePicker();

  XFile? _pickedFile;

  XFile? get pickedFile => _pickedFile;

  Future<void> pickFromGallery() async {
    final file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      _pickedFile = file;
      notifyListeners();
    }
  }

  Future<void> pickFromCamera() async {
    final file = await _picker.pickImage(source: ImageSource.camera);
    if (file != null) {
      _pickedFile = file;
      notifyListeners();
    }
  }

  File? get imageFile =>
      _pickedFile != null ? File(_pickedFile!.path) : null;
}