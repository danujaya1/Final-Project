import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/navigationbar/NavigationBar.dart';
import 'package:finalproject/routes/route_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> registerSubmit(BuildContext context) async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        usernameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Tidak boleh ada yang kosong'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: emailController.text.toString().trim(),
              password: passwordController.text);

      await firestore.collection('users').doc(userCredential.user!.uid).set({
        'username': usernameController.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Register Berhasil!',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Register Gagal'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> loginSubmit(BuildContext context) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Login Berhasil!',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
      );

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => NavBar()),
        (route) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login Gagal'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Logout Berhasil!'),
        backgroundColor: Colors.blue,
      ),
    );
    Get.toNamed(RouteName.loginscreen);
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
