import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieCard extends StatelessWidget {
  MovieCard({Key? key, required this.title, required this.rating, required this.linkImage}) : super(key: key);
	String title;
	String rating;
	String linkImage;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
			margin: const EdgeInsets.only(right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: screenWidth * 0.34,
            height: screenWidth * 0.5,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
									linkImage,
                )),
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
									width: screenWidth * .3,
                  child: Text(
                    title,
										overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Image(
                      width: 15,
                      height: 15,
                      image: AssetImage("assets/star.png"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      rating,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
