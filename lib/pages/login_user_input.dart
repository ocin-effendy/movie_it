import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:movie_it/widget/background.dart';

class LoginInput extends StatelessWidget {
  LoginInput({Key? key, required this.type}) : super(key: key);
	String type;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
        ),
        title: Text(
          type,
          style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
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
                  style: GoogleFonts.poppins(
                      color: Colors.grey[300],
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Welcome back! Please enter tour details.",
                  style: GoogleFonts.poppins(color: Colors.grey[400]),
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Username : ",
                          style: GoogleFonts.poppins(
                              color: Colors.grey, fontSize: 14),
                        ),
                        Container(
                          width: screenWidth * .8,
                          height: 50,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: GradientBoxBorder(
                                gradient: LinearGradient(
                                    colors: [Colors.red, Colors.deepPurple])),
                          ),
                          child: TextField(
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                                disabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Password : ",
                          style: GoogleFonts.poppins(
                              color: Colors.grey, fontSize: 14),
                        ),
                        Container(
                          width: screenWidth * .8,
                          height: 50,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: GradientBoxBorder(
                                gradient: LinearGradient(
                                    colors: [Colors.red, Colors.deepPurple])),
                          ),
                          child: TextField(
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                                disabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20)),
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          style: GoogleFonts.poppins(
                              color: Colors.grey,
                              textStyle: TextStyle(
                                  decoration: TextDecoration.underline)),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: screenWidth * .8,
                        height: 50,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          gradient: LinearGradient(
                              colors: [Colors.red, Colors.deepPurple]),
                        ),
                        child: Center(
                            child: Text(
                          type,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500, color: Colors.white),
                        )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
						bottom: -screenHeight * .07,
						right: -screenWidth * 0.1,
            child: Container(
						padding: const EdgeInsets.all(55),
              width: screenWidth * .65,
              height: screenWidth * .65,
              decoration:BoxDecoration(
							shape: BoxShape.circle,
							gradient: LinearGradient(
								colors: [
									Colors.red.withOpacity(.5),
									Colors.deepPurple.withOpacity(.5)
								]
							)
						),
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
                              color: Colors.white.withOpacity(0.5), shape: BoxShape.circle)),
										Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.5), shape: BoxShape.circle)),
                    ],
                  ),
								Column(
									mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.5), shape: BoxShape.circle)),
										Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.5), shape: BoxShape.circle)),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
