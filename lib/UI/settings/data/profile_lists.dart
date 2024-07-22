import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

final List<String> accountIcons = [
  'assets/svg/profile.svg',
  'assets/svg/history.svg',
  'assets/svg/infinite.svg'
];
final List<String> accountLabels = ['Personal Information', 'Limits', 'Legal'];

final List<IconData> settingsIcons = [
  IconlyLight.category,
  Icons.currency_bitcoin_sharp,
  Icons.lock_outline_rounded
];
final List<String> settingsLabels = ['Notifications', 'Bitcoin', 'Security'];

final List<IconData> supportIcons = [
  Icons.help_outline_rounded,
  Icons.contact_support_outlined,
  Icons.logout
];
final List<String> supportLabels = ['Help', 'Feedback', 'Logout'];

final List<IconData> profilePictureIcons = [
  Icons.camera_alt_outlined,
  Icons.photo_library_outlined,
];

final List<String> profilePicturelabels = ['Take photo', 'Choose from library'];

// final List<Map<dynamic, String>> acount = [
//   {'assets/svg/profile.svg': 'Personal Information'},
//   {'assets/svg/history.svg': 'Limits'},
//   {'assets/svg/infinite.svg': 'Legal'}
// ];
//
// final List<Map<dynamic, String>> settings = [
//   {
//     Icons.notifications_none_rounded: 'Notifications',
//   },
//   {Icons.currency_bitcoin_sharp: 'Bitcoin'},
//   {Icons.lock_outline_rounded: 'Security'}
// ];
//
// final List<Map<dynamic, String>> support = [
//   {Icons.help_outline_rounded: 'Help'},
//   {Icons.contact_support_outlined: 'Feedback'},
//   {Icons.logout: 'Logout'}
// ];

final List<String> helps = [
  'Account access',
  'Account limits',
  'Account verification',
  'Deposits & withdrawals',
  'Payments',
  "Bitcoin & Lightning",
  'Referrals',
  'Feedback',
  'Other'
];
