import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_it/controller/auth_controller.dart';
import 'package:movie_it/controller/database_controller.dart';
import 'package:movie_it/controller_bindings.dart';
import 'package:movie_it/pages/login_page.dart';
import 'package:movie_it/root.dart';
import 'package:movie_it/utils/loading_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseDatabase database = FirebaseDatabase.instance;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final authController = Get.put(AuthController(), permanent: true);
  final dbController = Get.put(DatabaseController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: authController.streamAuthStatus,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            return GetMaterialApp(
              initialBinding: ControllerBindings(),
              debugShowCheckedModeBanner: false,
              theme: ThemeData(scaffoldBackgroundColor: Colors.black),
              home: snapshot.data != null && snapshot.data!.emailVerified
                  ? Root()
                  : LoginPage(),
            );
          }
          return LoadingView();
        });
  }
}
