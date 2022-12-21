import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_it/controller/auth_controller.dart';
import 'package:movie_it/controller/database_controller.dart';
import 'package:movie_it/controller/movie_controller.dart';
import 'package:movie_it/controller/screen_controller.dart';
import 'package:movie_it/pages/detailmovie.dart';

const String BASE_IMAGE_URL = 'https://image.tmdb.org/t/p/w500';

class MovieCard extends StatelessWidget {
  MovieCard(
      {Key? key,
      required this.id,
      required this.title,
      required this.rating,
      required this.linkImage})
      : super(key: key);

  int id;
  String title;
  String rating;
  String linkImage;

  final screenController = Get.find<ScreenController>();
  final movieController = Get.find<MovieController>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        movieController.fetchDataDetailMovie(id);
        screenController.setCurrentScreen(
            DetailMovie(
              id: id,
            ),
            screenController.currentTab);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: screenWidth * 0.5,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: CachedNetworkImage(
                  imageUrl: "$BASE_IMAGE_URL$linkImage",
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
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
                      style: GoogleFonts.nunito(
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
                        style: GoogleFonts.nunito(
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
      ),
    );
  }
}
