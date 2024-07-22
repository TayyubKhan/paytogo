import 'package:paytogo/UI/authentication/forgotPassword.dart';
import 'package:paytogo/UI/authentication/login_screen.dart';
import 'package:paytogo/UI/authentication/select_country_screen.dart';
import 'package:paytogo/UI/authentication/signup_screen.dart';
import 'package:paytogo/UI/dashboard/homepage.dart';
import 'package:paytogo/UI/onboarding/onboarding.dart';
import 'package:paytogo/UI/settings/app_notification_settings.dart';
import 'package:paytogo/UI/settings/help_screen.dart';
import 'package:paytogo/UI/settings/help_template.dart';
import 'package:paytogo/UI/splash_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/error_screen.dart';
import '../../UI/authentication/otp_screen.dart';
import '../../UI/authentication/personal_details.dart';
import '../../UI/authentication/services_screen.dart';
import '../../UI/dashboard/bitcoin_info_screen.dart';
import '../../UI/settings/bitcoin_settings_screen.dart';
import '../../UI/settings/edit_profile_screen.dart';
import '../../UI/settings/faq_screen.dart';
import '../../UI/settings/legal_screen.dart';
import '../../UI/settings/limits_screen.dart';
import '../../UI/settings/personal_info_screen.dart';
import '../../UI/settings/profile_screen.dart';
import '../../UI/settings/qr_screen.dart';
import '../../UI/settings/security_settings_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );

    case OnBoarding.routeName:
      return MaterialPageRoute(
        builder: (context) => const OnBoarding(),
      );

    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );

    case OTPScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const OTPScreen(),
      );

    case SignUpScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      );

    case SelectCountryScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SelectCountryScreen(),
      );

    case PersonalDetails.routeName:
      return MaterialPageRoute(
        builder: (context) => PersonalDetails(),
      );

    case ServicesScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => ServicesScreen(),
      );
    case ForgetPassword.routeName:
      return MaterialPageRoute(
        builder: (context) => const ForgetPassword(),
      );

    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );

    case BitcoinInfoScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const BitcoinInfoScreen(),
      );

    case ProfileScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const ProfileScreen(),
      );

    case QRScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const QRScreen(),
      );

    case EditProfileScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const EditProfileScreen(),
      );

    case PersonalInfoScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const PersonalInfoScreen(),
      );

    case LimitScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const LimitScreen(),
      );

    case FAQScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const FAQScreen(),
      );

    case LegalScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const LegalScreen(),
      );

    case AppNotificationScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const AppNotificationScreen(),
      );

    case BitcoinSettinsScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const BitcoinSettinsScreen(),
      );

    case SecuritySettingScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SecuritySettingScreen(),
      );

    case HelpScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const HelpScreen(),
      );

    case HelpTemplateScreen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final String title = arguments['title'] as String;
      final void Function() onConfirm =
          arguments['onConfirm'] as void Function();

      return MaterialPageRoute(
        builder: (context) => HelpTemplateScreen(
          title: title,
          onConfirm: onConfirm,
        ),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(error: "Page doesn't exist"),
        ),
      );
  }
}
