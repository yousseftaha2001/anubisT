import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class StorageServices {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> uploadFile(String filePath, String phone) async {
    File file = File(filePath);
    late String dowbloadUrl;

    try {
      await firebase_storage.FirebaseStorage.instance
          .ref(phone)
          .putFile(file)
          .whenComplete(() async {
        dowbloadUrl = await firebase_storage.FirebaseStorage.instance
            .ref(phone)
            .getDownloadURL();
      });
      print(dowbloadUrl);
    } catch (e) {
      print(e.toString());
      // e.g, e.code == 'canceled'
    }
  }
}
