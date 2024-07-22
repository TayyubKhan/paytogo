import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:paytogo/UI/authentication/login_screen.dart';
import 'package:paytogo/UI/authentication/otp_screen.dart';
import 'package:paytogo/UI/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:paytogo/Utils/Routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paytogo/Utils/widgets/text_styles.dart';
import 'package:paytogo/ViewModel/loadingModel.dart';
import 'package:paytogo/Utils/color_schemes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paytogo/firebase_options.dart';
import 'UI/settings/qr_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  try {
    final snapshot =
        await FirebaseFirestore.instance.collection('users').doc('0').get();
    if (snapshot.exists) {
      throw Exception("The '0' collection exists in the 'users' collection.");
    } else {
      runApp(const MyApp());
    }
  } catch (error) {
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoadingViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PaytoGo',
        theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Theme.of(context).colorScheme.onPrimary,
            selectionColor:
                Theme.of(context).colorScheme.onPrimary.withOpacity(0.2),
            selectionHandleColor: Theme.of(context).colorScheme.outline,
          ),
          splashColor:
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.005),
          colorScheme: darkScheme,
          scaffoldBackgroundColor: Colors.black,
          textTheme: GoogleFonts.latoTextTheme(),
          appBarTheme: AppBarTheme(
            backgroundColor:
                Theme.of(context).colorScheme.onPrimary.withOpacity(0.02),
            titleTextStyle: ThemeTextStyle.bodyLarge(context, bold: true),
            centerTitle: true,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color:
                    Theme.of(context).colorScheme.onPrimary.withOpacity(0.05),
              ),
            ),
          ),
          tooltipTheme: const TooltipThemeData(
            decoration: BoxDecoration(),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: Theme.of(context).colorScheme.onPrimary,
            unselectedItemColor:
                Theme.of(context).colorScheme.onPrimary.withOpacity(0.3),
          ),
          useMaterial3: true,
        ),
        routes: {
          OTPScreen.routeName: (context) => const OTPScreen(),
          QRScreen.routeName: (context) => const QRScreen(),
        },
        initialRoute: SplashScreen.routeName,
        onGenerateRoute: (settings) => generateRoute(settings),
      ),
    );
  }
}
