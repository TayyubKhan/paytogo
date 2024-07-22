import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:paytogo/UI/settings/edit_profile_screen.dart';
import '../../../Firebase_Services/Firebase_Auth_Services.dart';
import '../../../Utils/widgets/text_styles.dart';
import '../../dashboard/widgets/buttons.dart';
import '../qr_screen.dart';
import '../utilities/upload_profile_picture.dart';

class MainProfileCard extends StatefulWidget {
  const MainProfileCard(
      {super.key,
      required this.icon,
      this.onTap,
      this.onTapAvatar,
      this.name,
      this.image,
      this.email});
  final IconData icon;
  final void Function()? onTap;
  final void Function()? onTapAvatar;
  final String? name;
  final String? email;
  final String? image;

  @override
  State<MainProfileCard> createState() => _MainProfileCardState();
}

class _MainProfileCardState extends State<MainProfileCard> {
  File? imageFile;

  // this will only called when image is selected
  getImageFile(File? image) {
    if (image != null) {
      setState(() => imageFile = image);
      uploadImage(image);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: widget.onTap ?? () {},
      child: Container(
        height: 170,
        width: size.width,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 13,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/images/coins.png',
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: SquaredButton(
                        icon: Icon(widget.icon, size: 15),
                        onPressed: () {},
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        updateProfilePicture(context, getImageFile);
                      },
                      child: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        radius: 15,
                        foregroundImage: widget.image!.isNotEmpty
                            ? CachedNetworkImageProvider(
                                widget.image.toString())
                            : null,
                        child: widget.image!.isEmpty
                            ? Icon(
                                Icons.person_2_outlined,
                                color: Theme.of(context).colorScheme.primary,
                                size: 15,
                              )
                            : null,
                      ),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox(height: 10)),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    widget.name!,
                    style: ThemeTextStyle.bodyMedium(context),
                  ),
                  Text(
                    widget.email!,
                    style: ThemeTextStyle.bodySmall(context),
                  ),
                ]),
                const Expanded(child: SizedBox(height: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: size.width * 0.37,
                        height: 40,
                        child: BuySellButton(
                          text: 'Show QR',
                          onPressed: () {
                            Navigator.of(context).pushNamed(QRScreen.routeName,
                                arguments:
                                    ScreenArguments(widget.email.toString()));
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * 0.05),
                    Expanded(
                      child: SizedBox(
                        width: size.width * 0.37,
                        height: 40,
                        child: BuySellButton(
                          text: 'Profile',
                          onPressed: () => Navigator.of(context)
                              .pushNamed(EditProfileScreen.routeName),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
