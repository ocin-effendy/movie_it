import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_it/controller/auth_controller.dart';
import 'package:movie_it/controller/database_controller.dart';
import 'package:movie_it/controller/movie_controller.dart';
import 'package:movie_it/controller/screen_controller.dart';
import 'package:movie_it/pages/film_page.dart';
import 'package:movie_it/pages/tv_shows_page.dart';
import 'package:movie_it/widget/background.dart';
import 'package:movie_it/widget/moviecard.dart';

class DetailMovie extends StatefulWidget {
  DetailMovie({required this.id});
  final int id;
  @override
  State<DetailMovie> createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  ScrollController scrollController = ScrollController();
  final movieC = Get.find<MovieController>();
  final screenC = Get.find<ScreenController>();
  final authC = Get.find<AuthController>();
  final dbC = Get.find<DatabaseController>();

  double containerHeight = 500;
  double imageOpacity = 1;
  bool statusBookmark = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: movieC.isLoadingDetail.value
              ? Stack(children: const [
                  Background(),
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                ])
              : Stack(
                  children: [
                    Container(
                        height: screenHeight * .55,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        color: Colors.black,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Opacity(
                                opacity: imageOpacity.clamp(0, 1.0),
                                child: SizedBox(
                                  width: screenWidth,
                                  height: screenHeight * .55,
                                  child: ClipRRect(
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "$BASE_IMAGE_URL${movieC.movieDetail?.posterPath ?? ''}",
                                      placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                ),
                              ),
                            ])),
                    Container(
                        height: screenHeight * .55,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              Colors.black.withOpacity(0),
                              Colors.black.withOpacity(0),
                              Colors.black.withOpacity(0),
                              Colors.black.withOpacity(.5),
                              Colors.black.withOpacity(1),
                            ]))),
                    SafeArea(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        physics: const BouncingScrollPhysics(),
                        child: SizedBox(
                          width: screenWidth,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: screenHeight * .5,
                              ),
                              SizedBox(
                                width: screenWidth * .8,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: screenWidth * .8,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        gradient: LinearGradient(colors: [
                                          Color.fromRGBO(210, 32, 60, 1),
                                          Color.fromRGBO(86, 66, 212, 1),
                                        ]),
                                      ),
                                      child: Center(
                                          child: Text(
                                        "Watch",
                                        style: GoogleFonts.nunito(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            fontSize: 16),
                                      )),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: screenWidth * .65,
                                          child: Text(
                                            movieC.movieDetail?.title ?? "",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: GoogleFonts.nunito(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {
                                              setState(() {
                                                if (dbC.getStatusMovie.value) {
                                                  dbC.deleteMovie(
                                                      authC.getUserId(),
                                                      widget.id);
                                                  dbC.getStatusMovie(false);
                                                } else {
                                                  dbC.writeDataMovie(
                                                    authC.getUserId(),
                                                    widget.id,
                                                    movieC.movieDetail?.title ??
                                                        "",
                                                    movieC.movieDetail
                                                            ?.voteAverage
                                                            .toStringAsFixed(
                                                                1) ??
                                                        "",
                                                    "$BASE_IMAGE_URL${movieC.movieDetail?.posterPath ?? ''}",
                                                    movieC.movieDetail
                                                            ?.overview ??
                                                        '',
                                                  );
                                                  dbC.getStatusMovie(true);
                                                }
                                              });
                                            },
                                            icon: dbC.getStatusMovie.value
                                                ? Icon(
                                                    Icons.bookmark,
                                                    size: 36,
                                                    color: Colors.white,
                                                  )
                                                : Icon(
                                                    Icons
                                                        .bookmark_border_rounded,
                                                    size: 36,
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
                                          movieC.movieDetail?.voteAverage
                                                  .toStringAsFixed(1) ??
                                              "",
                                          style: GoogleFonts.nunito(
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    SizedBox(
                                      height: 25,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: movieC
                                                  .movieDetail?.genres.length ??
                                              0,
                                          itemBuilder: (context, index) {
                                            String? genre = movieC.movieDetail
                                                ?.genres[index].name;
                                            return Container(
                                              margin:
                                                  EdgeInsets.only(right: 10),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 15),
                                              height: 25,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                                gradient:
                                                    LinearGradient(colors: [
                                                  Color.fromRGBO(210, 32, 60, 1)
                                                      .withOpacity(.5),
                                                  Color.fromRGBO(86, 66, 212, 1)
                                                      .withOpacity(.5),
                                                ]),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  genre!,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.nunito(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Popularity",
                                              style: GoogleFonts.nunito(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                            Text(
                                              movieC.movieDetail?.popularity
                                                      .toStringAsFixed(2) ??
                                                  '',
                                              style: GoogleFonts.nunito(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Language",
                                              style: GoogleFonts.nunito(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                            Text(
                                              movieC.movieDetail
                                                      ?.originalLanguage ??
                                                  '',
                                              style: GoogleFonts.nunito(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Status",
                                              style: GoogleFonts.nunito(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                            Text(
                                              movieC.movieDetail?.status ?? '',
                                              style: GoogleFonts.nunito(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Year",
                                              style: GoogleFonts.nunito(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                            Text(
                                              movieC.movieDetail?.releaseDate
                                                      .toString()
                                                      .split('-')[0] ??
                                                  '',
                                              style: GoogleFonts.nunito(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Description",
                                      style: GoogleFonts.nunito(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Text(
                                      movieC.movieDetail?.overview ?? '',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 6,
                                      style: GoogleFonts.nunito(
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          if (screenC.currentTab == 0) {
                            screenC.setCurrentScreen(
                                FilmPage(), screenC.currentTab);
                          } else if (screenC.currentTab == 1) {
                            screenC.setCurrentScreen(
                                TvShowsPage(), screenC.currentTab);
                          }
                          dbC.getStatusMovie(false);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.white,
                        )),
                  ],
                ),
        ),
      ),
    );
  }
}
