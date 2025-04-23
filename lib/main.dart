import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_commerce_app/utils/cart_manager.dart';
import 'package:quick_commerce_app/screens/splash_screen.dart'; // Import SplashScreen
import 'firebase_options.dart';
import 'package:quick_commerce_app/theme/theme.dart'; // Import AppTheme
import 'screens/explore_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/login_screen.dart'; // Import the login screen

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartManager()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quick Commerce App',
        theme: AppTheme.lightTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/explore': (context) => const ExploreScreen(initialCategory: 'All'),
          '/profile': (context) => const ProfileScreen(),
          '/login': (context) => const LoginScreen(), // Add this route
        },
      ),
    );
  }
}
