import 'dart:ui';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: screenWidth,
      height: screenHeight,
      child: Stack(
        children: [
          Positioned(
            top: screenHeight * .2,
            left: -screenWidth * .1,
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.withOpacity(0.5),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 100,
                  sigmaY: 100,
                ),
                child: Container(
                  width: 300,
                  height: 300,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * .5,
            left: screenWidth * .4,
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red.withOpacity(0.5),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 100,
                  sigmaY: 100,
                ),
                child: Container(
                  width: 300,
                  height: 300,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
