import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/choose_photo.dart';

class ImageFile {
  File? file;

  get imageFile => file;
  set image(File value) => file = value;
}

void updateProfilePicture(
    BuildContext context, void Function(File? image) onTap) {
  showModalBottomSheet(
    useSafeArea: true,
    isScrollControlled: true,
    context: context,
    builder: (context) => ChooseProfilePhoto(
      title: 'Profile Picture',
      getImageFile: onTap,
    ),
  );
}

Future<File?> selectImage(ImageSource source) async {
  XFile? pickedFile = await ImagePicker().pickImage(
    source: source,
  );
  if (pickedFile != null) {
    uploadImage(File(pickedFile.path));
    return File(pickedFile.path);
  }

  return null;
}

uploadImage(File image) async {
  await uploadProfilePictureAndSaveToFireStore(image);
  log('image is uploaded');
}

Future<void> uploadProfilePictureAndSaveToFireStore(File imageFile) async {
  final storage = FirebaseStorage.instance;
  final Reference ref = storage
      .ref()
      .child('profile_pictures/${DateTime.now().millisecondsSinceEpoch}.jpg');
  final UploadTask uploadTask = ref.putFile(imageFile);
  final TaskSnapshot downloadUrl = (await uploadTask);
  final String profilePictureUrl = await downloadUrl.ref.getDownloadURL();
  final currentUserUid = FirebaseAuth.instance.currentUser?.uid;
  if (currentUserUid != null) {
    final userDocRef =
        FirebaseFirestore.instance.collection('users').doc(currentUserUid);
    await userDocRef.update({'profilePictureUrl': profilePictureUrl});
  }
}
