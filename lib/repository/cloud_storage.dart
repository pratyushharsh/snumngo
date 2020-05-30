import 'dart:collection';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class CloudStorageRepository {
  final FirebaseStorage _firebaseStorage;

  CloudStorageRepository({FirebaseStorage firebaseStorage})
      : _firebaseStorage = firebaseStorage ?? FirebaseStorage.instance;


  Map<String, dynamic> uploadImage({@required File image}) {
    Map<String, dynamic> out = new HashMap();
    StorageReference storageReference = _firebaseStorage.ref().child('workers/${DateTime.now().toIso8601String()}.jpg');
    StorageUploadTask uploadTask = storageReference.putFile(image);
    out.putIfAbsent('task', () => uploadTask);
    out.putIfAbsent('storageRef', () => storageReference);
    return out;
  }
}
