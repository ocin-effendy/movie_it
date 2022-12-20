import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:movie_it/controller/auth_controller.dart';
import 'package:movie_it/controller/database_controller.dart';
import 'package:movie_it/controller/movie_controller.dart';
import 'package:movie_it/widget/background.dart';
import 'package:movie_it/widget/moviecard.dart';

class FilmPage extends StatefulWidget {
  @override
  State<FilmPage> createState() => _FilmPageState();
}

class _FilmPageState extends State<FilmPage> {
  FocusNode focusNode = FocusNode();
  final movieC = Get.find<MovieController>();
  final authC = Get.find<AuthController>();
	final dbC = Get.find<DatabaseController>();
  bool statusSearch = false;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        statusSearch = !statusSearch;
      });
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Stack(
            children: [
              const Background(),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {
														print("masuk ke klik");
                            authC.removeEmailFromLocal();
                            authC.logOut();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.white,
                          )),
                      Container(
                        width: screenWidth * .7,
                        height: 50,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: GradientBoxBorder(
                              gradient: LinearGradient(colors: [
                            Color.fromRGBO(210, 32, 60, 1),
                            Color.fromRGBO(86, 66, 212, 1),
                          ])),
                        ),
                        child: TextField(
                          focusNode: focusNode,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              icon: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              hintText: "Type title, actor, game etc",
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              disabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              suffixIcon: Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    gradient: statusSearch
                                        ? const LinearGradient(colors: [
                                            Color.fromRGBO(210, 32, 60, 1),
                                            Color.fromRGBO(86, 66, 212, 1),
                                          ])
                                        : null),
                                child: const Icon(
                                  Icons.list_rounded,
                                  color: Colors.white,
                                ),
                              )),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.mic_none,
                            color: Colors.white,
                            size: 36,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Continue Watching",
                                    style: GoogleFonts.nunito(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: screenHeight * .32,
                                    child: movieC.isLoading.value
                                        ? Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : ListView.builder(
                                            physics:
                                                const BouncingScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: movieC.movieModel
                                                    ?.results.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              return MovieCard(
                                                title: movieC
                                                        .movieModel
                                                        ?.results[index]
                                                        .title ??
                                                    "no title",
                                                rating: movieC
                                                        .movieModel
                                                        ?.results[index]
                                                        .voteAverage
                                                        .toString() ??
                                                    "0",
                                                linkImage: movieC
                                                        .movieModel
                                                        ?.results[index]
                                                        .posterPath ??
                                                    "",
                                                id: movieC.movieModel
                                                        ?.results[index].id ??
                                                    0,
                                              );
                                            }),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Top Movie",
                                    style: GoogleFonts.nunito(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: screenHeight * .32,
                                    child: movieC.isLoadingTop.value
                                        ? Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : ListView.builder(
                                            physics:
                                                const BouncingScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: movieC.movieTopModel
                                                    ?.results.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              return MovieCard(
                                                title: movieC
                                                        .movieTopModel
                                                        ?.results[index]
                                                        .title ??
                                                    "no title",
                                                rating: movieC
                                                        .movieTopModel
                                                        ?.results[index]
                                                        .voteAverage
                                                        .toString() ??
                                                    "0",
                                                linkImage: movieC
                                                        .movieTopModel
                                                        ?.results[index]
                                                        .posterPath ??
                                                    "",
                                                id: movieC.movieTopModel
                                                        ?.results[index].id ??
                                                    0,
                                              );
                                            }),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Popular on Movie it",
                                    style: GoogleFonts.nunito(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: screenHeight * .32,
                                    child: movieC.isLoadingPopular.value
                                        ? Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : ListView.builder(
                                            physics:
                                                const BouncingScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: movieC.moviePopularModel
                                                    ?.results.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              return MovieCard(
                                                title: movieC
                                                        .moviePopularModel
                                                        ?.results[index]
                                                        .title ??
                                                    "no title",
                                                rating: movieC
                                                        .moviePopularModel
                                                        ?.results[index]
                                                        .voteAverage
                                                        .toString() ??
                                                    "0",
                                                linkImage: movieC
                                                        .moviePopularModel
                                                        ?.results[index]
                                                        .posterPath ??
                                                    "",
                                                id: movieC.moviePopularModel
                                                        ?.results[index].id ??
                                                    0,
                                              );
                                            }),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                child: statusSearch
                    ? Container(
                        margin: const EdgeInsets.only(top: 50),
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: screenWidth * .7,
                          height: screenHeight * .6,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.85),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: const GradientBoxBorder(
                                gradient: LinearGradient(colors: [
                              Color.fromRGBO(210, 32, 60, 1),
                              Color.fromRGBO(86, 66, 212, 1),
                            ])),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    "Search by...",
                                    style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 18),
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.close_rounded,
                                        color: Colors.white,
                                      )),
                                ),
                                ListTile(
                                  title: Text(
                                    "Quote",
                                    style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 18),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    "Keywords",
                                    style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 18),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    "Genres",
                                    style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 18),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    "Title",
                                    style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 18),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    "Year",
                                    style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 18),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    "Director",
                                    style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 18),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    "Actors",
                                    style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
