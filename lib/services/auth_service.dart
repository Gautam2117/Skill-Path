import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Stream to detect authentication changes
  Stream<User?> get user => _auth.authStateChanges();

  // Get the current user
  Future<User?> getCurrentUser() async {
    try {
      return _auth.currentUser;
    } catch (error) {
      print("Error fetching current user: ${error.toString()}");
      return null;
    }
  }

  // Sign in with Email and Password
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result =
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return result.user;
    } catch (error) {
      print("Error signing in: ${error.toString()}");
      return null;
    }
  }

  // Register with Email and Password
  Future<User?> registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result =
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return result.user;
    } catch (error) {
      print("Error registering: ${error.toString()}");
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (error) {
      print("Error signing out: ${error.toString()}");
    }
  }
}
