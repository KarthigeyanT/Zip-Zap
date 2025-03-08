import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quick_commerce_app/theme/theme.dart'; // Import the theme file
import 'screens/splash_screen.dart'; // Import the splash screen
import 'firebase_options.dart'; // Import Firebase options

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase with FirebaseOptions
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quick Commerce App',
      theme: AppTheme.lightTheme, // Apply custom theme
      debugShowCheckedModeBanner: false, // Remove debug banner
      home: const SplashScreen(), // Set SplashScreen as the home
    );
  }
}
