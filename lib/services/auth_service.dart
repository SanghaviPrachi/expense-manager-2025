import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // Login method
  static Future<void> login(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  // Registration method
  static Future<void> register(String name, String email, String password) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Update the user's display name
    await userCredential.user?.updateDisplayName(name);
  }

  // Reset password method
  static Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  // Logout method
  static Future<void> logout() async {
    await _auth.signOut();
  }

  // Get current user
  static User? get currentUser => _auth.currentUser;
}
