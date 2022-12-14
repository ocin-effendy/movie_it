import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:movie_it/controller/auth_controller.dart';
import 'package:movie_it/widget/background.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Background(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: screenHeight * .1,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: const GradientBoxBorder(
                            gradient: LinearGradient(colors: [
                          Color.fromRGBO(210, 32, 60, 1),
                          Color.fromRGBO(86, 66, 212, 1),
                        ]))),
                    child: Center(
                      child: GetBuilder<AuthController>(
                        init: authC,
                        initState: (_) => authC.getEmailFromLocal(),
                        builder: (controller) => ListTile(
                          leading: Image(image: AssetImage("assets/foto.jpg")),
                          title: Text(
                            "Nico",
                            style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                          subtitle: Text(
                            controller.emailUser,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.nunito(color: Colors.grey[400]),
                          ),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.border_color_outlined,
                                color: Colors.grey[500],
                              )),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "History",
                        style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Subscription",
                        style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Notification",
                        style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Card",
                        style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Help",
                        style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Log out",
                        style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
