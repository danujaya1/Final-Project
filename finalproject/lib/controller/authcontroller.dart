import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/navigationbar/NavigationBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> registerSubmit(BuildContext context) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: emailController.text.toString().trim(),
              password: passwordController.text);

      await firestore.collection('users').doc(userCredential.user!.uid).set({
        'username': usernameController.text,
      });
    } catch (e) {
      print(e);
      SnackBar(content: Text(e.toString()));
    }
  }

  Future<void> loginSubmit(BuildContext context) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => NavBar()),
        (route) => false,
      );
    } catch (e) {
      print(e);
      SnackBar(content: Text(e.toString()));
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<String?> getCurrentUsername() async {
    User? user = _firebaseAuth.currentUser;
    if (user != null) {
      DocumentSnapshot<Map<String, dynamic>> userData =
          await firestore.collection('users').doc(user.uid).get();
      return userData.get('username');
    }
    return null;
  }
}
