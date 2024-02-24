import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  AuthService._internal();

  static final AuthService _cache = AuthService._internal();

  factory AuthService() => _cache;

  Future<void> signUp(final String email, final String password) async {
    final User? user = (await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password))
        .user;
    if (user != null) {
      debugPrint("signed up: ${user.email}, ${user.uid}");
    }
  }

  Future<void> signIn(final String email, final String password) async {
    final User? user = (await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password))
        .user;
    if (user == null) {
      throw Exception("cannot sing in");
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> sendVerificatinEmail(final User user) async {
    await user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    User? user = FirebaseAuth.instance.currentUser;
    final bool isEmailVerified;
    if (user != null) {
      await user.reload();
      user = FirebaseAuth.instance.currentUser;
      isEmailVerified = user!.emailVerified;
    } else {
      isEmailVerified = false;
    }
    return isEmailVerified;
  }
}
