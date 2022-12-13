import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_it/controller/auth_controller.dart';
import 'package:movie_it/controller/movie_controller.dart';
import 'package:movie_it/controller/screen_controller.dart';
import 'package:movie_it/controller_bindings.dart';
import 'package:movie_it/pages/login_page.dart';
import 'package:movie_it/root.dart';
import 'package:movie_it/utils/loading_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final authController = Get.put(AuthController(), permanent: true);
  // final screenController = Get.put(ScreenController());
  // final movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: authController.streamAuthStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            print(snapshot.data);
            return GetMaterialApp(
              initialBinding: ControllerBindings(),
              debugShowCheckedModeBanner: false,
              theme: ThemeData(scaffoldBackgroundColor: Colors.black),
              home: snapshot.data != null ? Root() : LoginPage(),
            );
          }
          return LoadingView();
        });
  }
}
