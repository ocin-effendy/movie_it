import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:movie_it/controller/auth_controller.dart';
import 'package:movie_it/widget/background.dart';
import 'package:movie_it/widget/primary_button.dart';

class LoginInput extends StatefulWidget {
  LoginInput({Key? key, required this.type}) : super(key: key);
  String type;

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  bool showAnimated = false;
  bool showPass = false;
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  final authController = Get.find<AuthController>();

  @override
  void initState() {
    Future.delayed(Duration(microseconds: 1), () {
      setState(() {
        showAnimated = true;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    emailC.dispose();
    passwordC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            setState(() {
              showAnimated = false;
            });
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
        ),
        title: Text(
          widget.type,
          style: GoogleFonts.nunito(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              const Background(),
              SizedBox(
                width: screenWidth,
                height: screenHeight,
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * .2,
                    ),
                    Text(
                      "Hi, Hace a nice day",
                      style: GoogleFonts.nunito(
                          color: Colors.grey[300],
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Welcome back! Please enter tour details.",
                      style: GoogleFonts.nunito(
                          color: Colors.grey[400], fontSize: 17),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email Address : ",
                              style: GoogleFonts.nunito(
                                  color: Colors.grey, fontSize: 14),
                            ),
                            Container(
                              width: screenWidth * .8,
                              height: 50,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border: GradientBoxBorder(
                                    gradient: LinearGradient(colors: [
                                  Color.fromRGBO(210, 32, 60, 1),
                                  Color.fromRGBO(86, 66, 212, 1),
                                ])),
                              ),
                              child: TextField(
                                controller: emailC,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                decoration: InputDecoration(
                                    disabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 15)),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Password : ",
                              style: GoogleFonts.nunito(
                                  color: Colors.grey, fontSize: 14),
                            ),
                            Container(
                              width: screenWidth * .8,
                              height: 50,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border: GradientBoxBorder(
                                    gradient: LinearGradient(colors: [
                                  Color.fromRGBO(210, 32, 60, 1),
                                  Color.fromRGBO(86, 66, 212, 1),
                                ])),
                              ),
                              child: TextField(
                                controller: passwordC,
                                obscureText: !showPass,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                decoration: InputDecoration(
                                    disabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            showPass = !showPass;
                                          });
                                        },
                                        icon: Icon(
                                          showPass
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.grey,
                                        ))),
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Password?",
                              style: GoogleFonts.nunito(
                                  color: Colors.grey,
                                  textStyle: const TextStyle(
                                      decoration: TextDecoration.underline)),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (widget.type == "Login") {
                              authController.login(emailC.text, passwordC.text);
                            } else {
                              authController.signUp(
                                  emailC.text, passwordC.text);
                            }
                          },
                          child: PrimaryButton(
                            title: widget.type,
                            width: screenWidth * .8,
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AnimatedPositioned(
                curve: Curves.easeIn,
                duration: const Duration(milliseconds: 80),
                bottom: showAnimated ? -screenHeight * .08 : screenHeight * .3,
                right: showAnimated ? -screenWidth * .15 : screenWidth * .18,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 400),
                  opacity: showAnimated ? 1 : 0,
                  child: Container(
                    padding: const EdgeInsets.all(55),
                    width: screenWidth * .65,
                    height: screenWidth * .65,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(210, 32, 60, 1).withOpacity(.5),
                          Color.fromRGBO(86, 66, 212, 1).withOpacity(.5),
                        ])),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.5),
                                    shape: BoxShape.circle)),
                            Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(.5),
                                    shape: BoxShape.circle)),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(.5),
                                    shape: BoxShape.circle)),
                            Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(.5),
                                    shape: BoxShape.circle)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
