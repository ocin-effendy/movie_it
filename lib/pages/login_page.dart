import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:movie_it/pages/login_user_input.dart';
import 'package:movie_it/widget/background.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(children: [
				const Background(),
        SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Column(
						mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/logo.png")),
                ),
              ),
              Text(
                "Movie It",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w500),
              ),
							const SizedBox(height: 20,),
              SizedBox(
                  width: screenWidth * .8,
                  child: Text(
                    "enter your data to immerse yourself in the wordl of cinema",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
                  )),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
									Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => LoginInput(type: "Sign Up",)));
								},
                child: Container(
                  width: screenWidth * .8,
                  height: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gradient:
                        LinearGradient(colors: [
													Color.fromRGBO(210, 32, 60, 1),
													Color.fromRGBO(86, 66, 212, 1),
												]),
                  ),
                  child: Center(
                      child: Text(
                    "Sign Up",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, color: Colors.white),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "I already have an account?",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  TextButton(
                    onPressed: () {
											Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => LoginInput(type: "Login",)));

										},
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          fontSize: 18),
                    ),
                  )
                ],
              ),
							const SizedBox(height: 70,),
							Column(
								children: [
									const Text("Or Sign up with", style: TextStyle(color: Colors.grey, fontSize: 16)),
									Container(
										margin: const EdgeInsets.only(top: 20),
										width: screenWidth * .5,
										child: Row(
											mainAxisAlignment: MainAxisAlignment.spaceAround,
											children: [
												Container(
													padding: const EdgeInsets.all(12),
													width: 50,
													height: 50,
													decoration: BoxDecoration(
														borderRadius: const BorderRadius.all(Radius.circular(12)),
														border: const GradientBoxBorder(
															gradient: LinearGradient(
																colors: [
																	Color.fromRGBO(210, 32, 60, 1),
																	Color.fromRGBO(86, 66, 212, 1),
																]
															)
														),
														gradient: LinearGradient(
															colors: [
																Color.fromRGBO(210, 32, 60, 1).withOpacity(.35),
																Color.fromRGBO(86, 66, 212, 1).withOpacity(.35),

															]
														),
													),
													child: const Image(image: AssetImage("assets/google_logo.png")),
												),
												Container(
													padding: const EdgeInsets.all(12),
													width: 50,
													height: 50,
													decoration: BoxDecoration(
														borderRadius: const BorderRadius.all(Radius.circular(12)),
														border: const GradientBoxBorder(
															gradient: LinearGradient(
																colors: [
																	Color.fromRGBO(210, 32, 60, 1),
																	Color.fromRGBO(86, 66, 212, 1),
																]
															)
														),
														gradient: LinearGradient(
															colors: [
																Color.fromRGBO(210, 32, 60, 1).withOpacity(.35),
																Color.fromRGBO(86, 66, 212, 1).withOpacity(.35),
															]
														),
													),
													child: const Image(image: AssetImage("assets/apple_logo.png")),
												),
												Container(
													padding: const EdgeInsets.all(12),
													width: 50,
													height: 50,
													decoration: BoxDecoration(
														borderRadius: const BorderRadius.all(Radius.circular(12)),
														border: const GradientBoxBorder(
															gradient: LinearGradient(
																colors: [
																	Color.fromRGBO(210, 32, 60, 1),
																	Color.fromRGBO(86, 66, 212, 1),
																]
															)
														),
														gradient: LinearGradient(
															colors: [
																Color.fromRGBO(210, 32, 60, 1).withOpacity(.35),
																Color.fromRGBO(86, 66, 212, 1).withOpacity(.35),
															]
														),
													),
													child: const Image(image: AssetImage("assets/facebook_logo.png")),
												),
											],
										),
									)
								],
							)
            ],
          ),
        ),
      ]),
    );
  }
}
