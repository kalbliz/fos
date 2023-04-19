import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as fStorage;

class ImageUploadService extends GetxService {
  Future uploadFile(
      {required String imagePath, required String storagePath}) async {
    var imageDownloadUrl = '';
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    fStorage.Reference reference = fStorage.FirebaseStorage.instance
        .ref()
        .child(storagePath)
        .child(fileName);
    fStorage.UploadTask uploadTask = reference.putFile(File(imagePath));
    fStorage.TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
    await taskSnapshot.ref.getDownloadURL().then((url) {
      imageDownloadUrl = url;
    }).catchError((onError) {
      debugPrint(onError.toString());
    });
    return imageDownloadUrl;
  }
}
