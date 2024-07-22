import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paytogo/Firebase_Services/Firebase_Auth_Services.dart';
import 'package:paytogo/Firebase_Services/Firebase_Services.dart';
import 'package:paytogo/UI/authentication/login_screen.dart';
import 'package:paytogo/UI/dashboard/widgets/buttons.dart';
import 'package:paytogo/UI/onboarding/widgets/button.dart';
import 'package:paytogo/UI/settings/app_notification_settings.dart';
import 'package:paytogo/UI/settings/help_screen.dart';
import 'package:paytogo/UI/settings/legal_screen.dart';
import 'package:paytogo/UI/settings/personal_info_screen.dart';
import 'package:paytogo/UI/settings/security_settings_screen.dart';
import 'package:paytogo/UI/settings/widgets/buttons.dart';
import 'package:paytogo/UI/settings/widgets/main_profile_card.dart';
import 'package:paytogo/UI/settings/widgets/setting_tile.dart';
import 'package:paytogo/Utils/widgets/text_styles.dart';

import 'bitcoin_settings_screen.dart';
import 'data/profile_lists.dart';
import 'limits_screen.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = '';
  String email = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final _auth = FirebaseAuth.instance;
  void showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text(
          'Logout',
          style: ThemeTextStyle.bodyLarge(context, bold: true),
        ),
        content: Text(
          'Are you sure you want to log out?',
          style: ThemeTextStyle.bodyMedium(context),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: ThemeTextStyle.bodyMedium(context, bold: true),
            ),
          ),
          TextButton(
            onPressed: () {
              FirebaseAuthService().signOut().then((value) {
                Navigator.pushNamed(context, LoginScreen.routeName);
              });
            },
            child: Text(
              'Log out',
              style: ThemeTextStyle.bodyMedium(context,
                  bold: true,
                  color: Theme.of(context).colorScheme.onErrorContainer),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<void Function()> accountActions = [
      () => Navigator.of(context).pushNamed(PersonalInfoScreen.routeName),
      () => Navigator.of(context).pushNamed(LimitScreen.routeName),
      () => Navigator.of(context).pushNamed(LegalScreen.routeName),
    ];

    final List<void Function()> settingsActions = [
      () => Navigator.of(context).pushNamed(AppNotificationScreen.routeName),
      () => Navigator.of(context).pushNamed(BitcoinSettinsScreen.routeName),
      () => Navigator.of(context).pushNamed(SecuritySettingScreen.routeName),
    ];

    final List<void Function()> supportActions = [
      () => Navigator.of(context).pushNamed(HelpScreen.routeName),
      () {},
      showLogoutDialog,
    ];

    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const LeadingButton(
          icon: Icons.close_rounded,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(
              size.width * 0.05, size.width * 0.05, size.width * 0.05, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                  future: FireStoreService()
                      .getDocument('users', _auth.currentUser!.uid),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return MainProfileCard(
                        icon: Icons.share,
                        onTap: () {},
                        name: snapshot.data!.containsKey('FirstName')
                            ? snapshot.data!['FirstName']
                            : '',
                        email: snapshot.data!.containsKey('email')
                            ? snapshot.data!['email']
                            : '',
                        image: snapshot.data!.containsKey('profilePictureUrl')
                            ? snapshot.data!['profilePictureUrl']
                            : '',
                      );
                    }
                    return const SizedBox();
                  }),
              SizedBox(height: size.width * 0.05),
              Padding(
                padding: EdgeInsets.fromLTRB(size.width * 0.05, 0, 0, 0),
                child: Text('Account',
                    style: ThemeTextStyle.bodyLarge(context, bold: true)),
              ),
              SizedBox(height: size.width * 0.05),
              Container(
                alignment: Alignment.center,
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
                ),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => const LineSegment(),
                  itemCount: accountIcons.length,
                  itemBuilder: (context, index) {
                    return SettingTile(
                      leading: SquareButton(
                        child: SvgIcon(
                          path: accountIcons[index],
                          size: 10,
                        ),
                      ),
                      label: accountLabels[index],
                      onTap: accountActions[index],
                    );
                  },
                ),
              ),
              SizedBox(height: size.width * 0.05),
              Padding(
                padding: EdgeInsets.fromLTRB(size.width * 0.05, 0, 0, 0),
                child: Text('Settings',
                    style: ThemeTextStyle.bodyLarge(context, bold: true)),
              ),
              SizedBox(height: size.width * 0.05),
              Container(
                alignment: Alignment.center,
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
                ),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => const LineSegment(),
                  itemCount: settingsIcons.length,
                  itemBuilder: (context, index) {
                    return SettingTile(
                      leading: SquareButton(
                        child: SizedBox(
                          child: Icon(
                            settingsIcons[index],
                            size: 20,
                          ),
                        ),
                      ),
                      label: settingsLabels[index],
                      onTap: settingsActions[index],
                    );
                  },
                ),
              ),
              SizedBox(height: size.width * 0.05),
              Padding(
                padding: EdgeInsets.fromLTRB(size.width * 0.05, 0, 0, 0),
                child: Text('Support',
                    style: ThemeTextStyle.bodyLarge(context, bold: true)),
              ),
              SizedBox(height: size.width * 0.05),
              Container(
                alignment: Alignment.center,
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
                ),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => const LineSegment(),
                  itemCount: supportIcons.length,
                  itemBuilder: (context, index) {
                    return SettingTile(
                      leading: SquareButton(
                        child: SizedBox(
                          child: Icon(
                            supportIcons[index],
                            size: 20,
                          ),
                        ),
                      ),
                      label: supportLabels[index],
                      onTap: supportActions[index],
                    );
                  },
                ),
              ),
              SizedBox(height: size.width * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
