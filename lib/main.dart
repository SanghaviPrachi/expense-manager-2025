import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:expense_manager_2025/screens/login_screen.dart';
import 'package:expense_manager_2025/screens/registration_screen.dart';
import 'package:expense_manager_2025/screens/forgot_password_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(); // Initialize Firebase
  } catch (e) {
    // If Firebase initialization fails, show an error and exit
    print("Firebase initialization error: $e");
    return;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Manager 2025',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegistrationScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
      },
    );
  }
}
