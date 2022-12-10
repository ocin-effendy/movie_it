import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_it/controller_bindings.dart';
import 'package:movie_it/pages/login_page.dart';
import 'package:movie_it/root.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

	@override
	  Widget build(BuildContext context) {
		return GetMaterialApp(
			initialBinding: ControllerBindings(),
			debugShowCheckedModeBanner: false,
			theme: ThemeData(
				scaffoldBackgroundColor: Colors.black
			),
			home: LoginPage(),
		);
	}
}


