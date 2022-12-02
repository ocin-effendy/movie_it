import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class FavoriteMovieCard extends StatelessWidget {
  FavoriteMovieCard({Key? key, required this.title, required this.rating, required this.linkImage, required this.desc}) : super(key: key);
	String title;
	String rating;
	String linkImage;
	String desc;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * .9,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: GradientBoxBorder(
              gradient: LinearGradient(colors: [
            Color.fromRGBO(210, 32, 60, 1),
            Color.fromRGBO(86, 66, 212, 1),
          ]))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: screenWidth * 0.34,
            height: screenWidth * 0.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(linkImage))),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: screenWidth * .9 - screenWidth * 0.34 - 32,
            height: screenWidth * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
									crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
											padding: const EdgeInsets.only(top: 10),
											width: 150,
                      child: Text(
												title,
												maxLines: 2,
												overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    IconButton(
												padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(
                          Icons.bookmark_rounded,
                          color: Colors.white,
                        ))
                  ],
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
                      "9.1",
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  desc,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
