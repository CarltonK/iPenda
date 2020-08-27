import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iPenda/provider/indexNotifier.dart';
import 'package:iPenda/screens/Onboarding/onboarding.dart';
import 'package:iPenda/screens/pricing/pricing_base.dart';
import 'package:provider/provider.dart';

void main() {
  Crashlytics.instance.enableInDevMode = false;
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iPenda',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          bodyText1: GoogleFonts.quicksand(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          bodyText2: GoogleFonts.quicksand(),
          headline1: GoogleFonts.quicksand(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.black,
            letterSpacing: 2,
          ),
          headline2: GoogleFonts.quicksand(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
            letterSpacing: 1,
          ),
          headline3: GoogleFonts.quicksand(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Colors.black,
            letterSpacing: 1,
          ),
          headline4: GoogleFonts.quicksand(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),
      ),
      home: ChangeNotifierProvider(
        create: (context) => IndexNotifier(),
        child: Onboarding(),
      ),
    );
  }
}
