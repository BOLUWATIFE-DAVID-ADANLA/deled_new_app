import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthenticationService {
  final _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;
  // login
  Future<UserCredential> login(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result;
    } on FirebaseAuthException {
      debugPrint('there is an error bolu');
      throw 'there was an error';
    }
  }

  // register

  Future<UserCredential> register(String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return result;
    } on FirebaseAuthException {
      debugPrint('there is an error bolu');
      throw 'there was an error';
    }
  }

  // signout or log out
  Future<void> signout() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException {
      debugPrint('there is an error bolu');
      throw 'there was an error';
    }
  }

  Stream<User?> authStatechanges() {
    return _auth.authStateChanges();
  }
}
