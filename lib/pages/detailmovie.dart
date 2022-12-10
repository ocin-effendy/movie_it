import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_it/controller/movie_controller.dart';
import 'package:movie_it/controller/screen_controller.dart';
import 'package:movie_it/pages/film_page.dart';
import 'package:movie_it/pages/tv_shows_page.dart';
import 'package:movie_it/widget/moviecard.dart';

class DetailMovie extends StatefulWidget {
  DetailMovie({required this.id});
  final int id;
  @override
  State<DetailMovie> createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  ScrollController scrollController = ScrollController();
  final movieController = Get.put(MovieController());
  String linkImage = "";

  double containerHeight = 500;

  double imageOpacity = 1;

  final screenController = Get.find<ScreenController>();

  @override
  void initState() {
    movieController.fetchDataDetailMovie(widget.id);
    setState(() {
      linkImage = movieController.movieDetail?.posterPath ?? "";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: movieController.isLoadingDetail.value
            ? Center(
                child: CircularProgressIndicator(),
              )
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
                              child: Container(
                                width: screenWidth,
                                height: screenHeight * .55,
                                child: ClipRRect(
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "$BASE_IMAGE_URL${movieController.movieDetail?.posterPath ?? ''}",
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
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
                                      Text(
                                        "After",
                                        style: GoogleFonts.nunito(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      IconButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.bookmark_border_rounded,
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
                                        "9.1",
                                        style: GoogleFonts.nunito(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        width: 70,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          gradient: LinearGradient(colors: [
                                            Color.fromRGBO(210, 32, 60, 1)
                                                .withOpacity(.5),
                                            Color.fromRGBO(86, 66, 212, 1)
                                                .withOpacity(.5),
                                          ]),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Action",
                                            style: GoogleFonts.nunito(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        width: 70,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          gradient: LinearGradient(colors: [
                                            Color.fromRGBO(210, 32, 60, 1)
                                                .withOpacity(.5),
                                            Color.fromRGBO(86, 66, 212, 1)
                                                .withOpacity(.5),
                                          ]),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Crime",
                                            style: GoogleFonts.nunito(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        width: 70,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          gradient: LinearGradient(colors: [
                                            Color.fromRGBO(210, 32, 60, 1)
                                                .withOpacity(.5),
                                            Color.fromRGBO(86, 66, 212, 1)
                                                .withOpacity(.5),
                                          ]),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Drama",
                                            style: GoogleFonts.nunito(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ],
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
                                            "Length",
                                            style: GoogleFonts.nunito(
                                              color: Colors.grey,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            "Season 4",
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
                                            "English",
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
                                            "Rating",
                                            style: GoogleFonts.nunito(
                                              color: Colors.grey,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            "18+",
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
                                            "2021",
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
                                    "As a shocking truth about a couple's families emerges, the two lovers discover they are not so different from each other. Tessa is no longer the sweet, simple girl she was when she met Hardin.",
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
                        if (screenController.currentTab == 0) {
                          screenController.setCurrentScreen(
                              FilmPage(), screenController.currentTab);
                        } else if (screenController.currentTab == 1) {
                          screenController.setCurrentScreen(
                              TvShowsPage(), screenController.currentTab);
                        }
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                      )),
                ],
              ),
      ),
    );
  }
}
