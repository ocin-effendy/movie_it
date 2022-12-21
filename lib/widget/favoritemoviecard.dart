import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:movie_it/controller/auth_controller.dart';
import 'package:movie_it/controller/database_controller.dart';

class FavoriteMovieCard extends StatelessWidget {
  FavoriteMovieCard(
      {Key? key,
      required this.id,
      required this.title,
      required this.rating,
      required this.linkImage,
      required this.desc})
      : super(key: key);
  int id;
  String title;
  String rating;
  String linkImage;
  String desc;

  final authC = Get.find<AuthController>();
  final dbC = Get.find<DatabaseController>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
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
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    fit: BoxFit.fill, image: NetworkImage(linkImage))),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: screenWidth * .46,
            height: screenWidth * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: screenWidth * .3,
                      padding: const EdgeInsets.only(top: 10),
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
                        onPressed: () {
                          dbC.deleteMovie(authC.getUserId(), id);
                          dbC.deleteMovieInList(id);
                        },
                        icon: const Icon(
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
                      rating,
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
                  maxLines: 4,
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
