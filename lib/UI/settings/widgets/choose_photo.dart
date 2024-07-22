import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paytogo/UI/settings/utilities/upload_profile_picture.dart';
import 'package:paytogo/UI/settings/widgets/setting_tile.dart';
import '../../dashboard/data/lists_data.dart';
import '../../dashboard/widgets/buttons.dart';
import '../data/profile_lists.dart';
import 'buttons.dart';

class ChooseProfilePhoto extends StatefulWidget {
  const ChooseProfilePhoto({
    super.key,
    required this.title,
    required this.getImageFile,
  });
  final String title;
  final void Function(File? image) getImageFile;

  @override
  State<ChooseProfilePhoto> createState() => _ChooseProfilePhotoState();
}

class _ChooseProfilePhotoState extends State<ChooseProfilePhoto> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final List<void Function()> functions = [
      () async {
        final File? imageFile = await selectImage(ImageSource.camera);
        if (imageFile != null) {
          widget.getImageFile(imageFile);
        }
      },
      () async {
        final File? imageFile = await selectImage(ImageSource.gallery);
        if (imageFile != null) {
          widget.getImageFile(imageFile);
        }
      },
    ];
    return BottomSheet(
      onClosing: () {},
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(0),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: const RoundedRectangleBorder(
                side: BorderSide.none,
              ),
              leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.close,
                  size: 20,
                ),
              ),
              title: Text(
                widget.title,
              ),
            ),
            SizedBox(height: size.width * 0.05),
            Container(
              alignment: Alignment.center,
              height: 164,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
              ),
              child: ListView.separated(
                separatorBuilder: (context, index) => const LineSegment(),
                itemCount: receiveBitcoinIcons.length,
                itemBuilder: (context, index) {
                  return SettingTile(
                    leading: SquareButton(
                      child: SizedBox(
                        child: Icon(
                          profilePictureIcons[index],
                          size: 20,
                        ),
                      ),
                    ),
                    label: profilePicturelabels[index],
                    onTap: () => functions[index](),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
