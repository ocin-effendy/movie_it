import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_it/pages/login_page.dart';
import 'package:movie_it/root.dart';
import 'package:movie_it/widget/primary_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  String emailUser = '';

  void setEmailToLocal(String email) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('email', email);
  }

  void removeEmailFromLocal() async {
    final pref = await SharedPreferences.getInstance();
    pref.remove('email');
  }

  void getEmailFromLocal() async {
    final pref = await SharedPreferences.getInstance();
    String? email = pref.getString('email');
    if (email != null) {
      emailUser = email;
      update();
    }
  }
	
	String getUserId(){
		final User? user = auth.currentUser;
		final uid = user!.uid;
		return uid;
	}

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void login(String email, String password) async {
    try {
      UserCredential userC = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      // await auth.signInWithEmailAndPassword(email: email, password: password);
      if (userC.user!.emailVerified) {
        setEmailToLocal(email);
        Get.offAll(Root());
      } else {
        Get.defaultDialog(
          title: "Login Failed!",
          middleText: "Please verification your email!",
          backgroundColor: Colors.white,
          buttonColor: Color.fromRGBO(210, 32, 60, 1),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          confirm: GestureDetector(
            onTap: () async {
              await userC.user!.sendEmailVerification();
              Get.back();
            },
            child: PrimaryButton(
              title: "Verification!",
              width: 100.0,
              height: 30.0,
            ),
          ),
          cancel: GestureDetector(
            onTap: () => Get.back(),
            child: PrimaryButton(
              title: "cancel",
              width: 80.0,
              height: 30.0,
            ),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.defaultDialog(
          title: "Login Failed!",
          middleText: "Please check your Email!, No user found for that email",
          backgroundColor: Colors.white,
          buttonColor: Color.fromRGBO(210, 32, 60, 1),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          confirm: GestureDetector(
            onTap: () => Get.back(),
            child: PrimaryButton(
              title: "Oke",
              width: 80.0,
              height: 30.0,
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Get.defaultDialog(
          title: "Login Failed!",
          middleText: "Please check your passord!, Wrong password",
          backgroundColor: Colors.white,
          buttonColor: Color.fromRGBO(210, 32, 60, 1),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          confirm: GestureDetector(
            onTap: () => Get.back(),
            child: PrimaryButton(
              title: "Oke",
              width: 80.0,
              height: 30.0,
            ),
          ),
        );
      }
    }
  }

  void signUp(String email, String password) async {
    try {
      UserCredential userC = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await userC.user!.sendEmailVerification();
      Get.defaultDialog(
        title: "Verification Email",
        middleText: "Please, check your email box!",
        backgroundColor: Colors.white,
        buttonColor: Color.fromRGBO(210, 32, 60, 1),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        confirm: GestureDetector(
          onTap: () {
            Get.back();
            Get.back();
          },
          child: PrimaryButton(
            title: "Oke",
            width: 80.0,
            height: 30.0,
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-user') {
        print('email already in use.');
        Get.defaultDialog(
          title: "Signup Failed!",
          middleText: "Email already in use!",
          backgroundColor: Colors.white,
          buttonColor: Color.fromRGBO(210, 32, 60, 1),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          confirm: GestureDetector(
            onTap: () => Get.back(),
            child: PrimaryButton(
              title: "Oke",
              width: 80.0,
              height: 30.0,
            ),
          ),
        );
      } else if (e.code == 'weak-password') {
        print('Weak password provided for that user.');
        Get.defaultDialog(
          title: "Signup Failed!",
          middleText: "Weak password!",
          backgroundColor: Colors.white,
          buttonColor: Color.fromRGBO(210, 32, 60, 1),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          confirm: GestureDetector(
            onTap: () => Get.back(),
            child: PrimaryButton(
              title: "Oke",
              width: 80.0,
              height: 30.0,
            ),
          ),
        );
      }
    }
  }

  void logOut() async {
    await auth.signOut();
    Get.offAll(LoginPage());
  }
}
