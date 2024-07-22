import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paytogo/Firebase_Services/Firebase_Services.dart';
import 'package:paytogo/UI/onboarding/widgets/button.dart';
import 'package:paytogo/UI/settings/widgets/buttons.dart';
import 'package:paytogo/UI/settings/widgets/text_form_field.dart';
import 'package:paytogo/Utils/classes.dart';
import 'package:paytogo/ViewModel/loadingModel.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  static const routeName = '/edit_profile';
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController lightningController = TextEditingController();
  final TextEditingController tippingController = TextEditingController();

  File? imageFile;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  void onSubmit(LoadingViewModel value) async {
    value.isLoading();
    final bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      value.isLoading();
      return;
    }
    formKey.currentState!.save();
    debugPrint(userNameController.text);
    debugPrint(bioController.text);
    debugPrint(lightningController.text);
    debugPrint(tippingController.text);
    final newUserData = {
      'username': userNameController.text,
      'bio': bioController.text,
      'lightningAddress': lightningController.text,
      'tippingPage': tippingController.text
    };
    FireStoreService().updateUserData(newUserData);
    await Future.delayed(const Duration(seconds: 2));
    value.isLoading();
    Navigator.of(context).pop();
  }

  // void getImageFile(File? image) {
  //   if (image != null) {
  //     setState(() => imageFile = image);
  //   }
  // }
  final firestore = FirebaseFirestore.instance.collection('users');
  Future<void> loadUserData() async {
    try {
      DocumentSnapshot snapshot =await firestore.doc(auth.currentUser!.uid).get();
      Map<String, dynamic>? data =
      snapshot.data() as Map<String, dynamic>?;
      if (data != null) {
        if (data.containsKey('username')) {
          userNameController.text = data['username'];
        } else {
          userNameController.text = '';
        }
        bioController.text = data.containsKey('bio') ? data['bio'] : '';
        lightningController.text = data.containsKey('lightningAddress')
            ? data['lightningAddress']
            : '';
        print('build');
        tippingController.text =
            data.containsKey('tippingPage') ? data['tippingPage'] : '';
      }
    } catch (e) {
      print('Error loading user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const LeadingButton(
          icon: Icons.close_rounded,
        ),
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
          child: StreamBuilder(
              stream: FireStoreService()
                  .listenToDocument('users', auth.currentUser!.uid),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.exists) {
                  Map<String, dynamic>? data =
                      snapshot.data!.data() as Map<String, dynamic>?;

                  return Container(
                    padding: EdgeInsets.fromLTRB(size.width * 0.05,
                        size.width * 0.05, size.width * 0.05, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: size.height * 0.1,
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 45,
                                backgroundColor: Colors.white,
                                foregroundImage: data!
                                        .containsKey('profilePictureUrl')
                                    ? CachedNetworkImageProvider(
                                        data['profilePictureUrl'].toString())
                                    : null,
                                child: !data.containsKey('profilePictureUrl')
                                    ? Icon(
                                        Icons.person_2_outlined,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        size: 23,
                                      )
                                    : null,
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: InkWell(
                                  onTap: () {
                                    // updateProfilePicture(context, getImageFile);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondaryContainer),
                                    child: Icon(
                                      Icons.add_rounded,
                                      size: 20,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        Container(
                          padding: const EdgeInsets.fromLTRB(18, 20, 18, 20),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withOpacity(0.1),
                          ),
                          child: Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ProfileTextField(
                                  labelText: 'Username',
                                  hintText: 'Your username',
                                  controller: userNameController,
                                  validator: (value) {
                                    if (value != null && value.isNotEmpty) {
                                      return null;
                                    }
                                    return 'Enter username';
                                  },
                                ),
                                const SizedBox(height: 15),
                                ProfileTextField(
                                  labelText: 'Bio',
                                  hintText: 'Your bio',
                                  controller: bioController,
                                  validator: (value) {
                                    if (value != null && value.isNotEmpty) {
                                      return null;
                                    }
                                    return 'Enter bio';
                                  },
                                  onFieldSubmitted: (v) {},
                                ),
                                const SizedBox(height: 15),
                                ProfileTextField(
                                  labelText: 'Your lightning address',
                                  hintText: 'Enter lightning address',
                                  suffixIcon: Icons.copy_all_rounded,
                                  suffixOnTap: () {},
                                  controller: lightningController,
                                  validator: (value) {
                                    if (value != null && value.isNotEmpty) {
                                      return null;
                                    }
                                    return 'Enter lightning address';
                                  },
                                ),
                                const SizedBox(height: 15),
                                ProfileTextField(
                                  labelText: 'Your tipping page',
                                  hintText: 'Enter Tipping page',
                                  suffixIcon: Icons.launch_rounded,
                                  suffixOnTap: () {},
                                  controller: tippingController,
                                  validator: (value) {
                                    if (value != null && value.isNotEmpty) {
                                      return null;
                                    }
                                    return 'Enter Tipping page';
                                  },
                                ),
                                const SizedBox(height: 15),
                                Consumer<LoadingViewModel>(
                                    builder: (context, value, child) {
                                  return EditButton(
                                    text: 'Edit Profile',
                                    onTap: () {
                                      onSubmit(value);
                                    },
                                    loading: value.loading,
                                  );
                                })
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: size.width * 0.05),
                      ],
                    ),
                  );
                }
                return const SizedBox();
              })),
    );
  }

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    bioController.dispose();
    lightningController.dispose();
    tippingController.dispose();
  }
}
