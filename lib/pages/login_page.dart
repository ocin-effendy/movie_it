import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:movie_it/pages/login_user_input.dart';
import 'package:movie_it/widget/background.dart';
import 'package:movie_it/widget/primary_button.dart';

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
                style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: screenWidth * .7,
                  child: Text(
                    "Enter your data to immerse yourself in the wordl of cinema",
                    textAlign: TextAlign.center,
                    style:
                        GoogleFonts.nunito(color: Colors.white, fontSize: 16),
                  )),
              const SizedBox(
                height: 60,
              ),
              GestureDetector(
                onTap: () => Get.to(LoginInput(type: "Sign Up")),
                child: PrimaryButton(
                  title: "Sign Up",
                  width: screenWidth * .8,
                  height: 50,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "I already have an account?",
                    style: GoogleFonts.nunito(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                    onPressed: () => Get.to(LoginInput(type: "Login")),
                    child: Text(
                      "Login",
                      style: GoogleFonts.nunito(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              Column(
                children: [
                  Text("Or Sign up with",
                      style: GoogleFonts.nunito(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            border: const GradientBoxBorder(
                                gradient: LinearGradient(colors: [
                              Color.fromRGBO(210, 32, 60, 1),
                              Color.fromRGBO(86, 66, 212, 1),
                            ])),
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(210, 32, 60, 1).withOpacity(.35),
                              Color.fromRGBO(86, 66, 212, 1).withOpacity(.35),
                            ]),
                          ),
                          child: const Image(
                              image: AssetImage("assets/google_logo.png")),
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            border: const GradientBoxBorder(
                                gradient: LinearGradient(colors: [
                              Color.fromRGBO(210, 32, 60, 1),
                              Color.fromRGBO(86, 66, 212, 1),
                            ])),
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(210, 32, 60, 1).withOpacity(.35),
                              Color.fromRGBO(86, 66, 212, 1).withOpacity(.35),
                            ]),
                          ),
                          child: const Image(
                              image: AssetImage("assets/apple_logo.png")),
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            border: const GradientBoxBorder(
                                gradient: LinearGradient(colors: [
                              Color.fromRGBO(210, 32, 60, 1),
                              Color.fromRGBO(86, 66, 212, 1),
                            ])),
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(210, 32, 60, 1).withOpacity(.35),
                              Color.fromRGBO(86, 66, 212, 1).withOpacity(.35),
                            ]),
                          ),
                          child: const Image(
                              image: AssetImage("assets/facebook_logo.png")),
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
