import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:movie_it/controller/movie_controller.dart';
import 'package:movie_it/widget/background.dart';
import 'package:movie_it/widget/moviecard.dart';

class TvShowsPage extends StatefulWidget {
  @override
  State<TvShowsPage> createState() => _TvShowsPageState();
}

class _TvShowsPageState extends State<TvShowsPage> {
  FocusNode focusNode = FocusNode();
  final movieController = Get.find<MovieController>();

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
                          onPressed: () {},
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
                  Expanded(
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
                                  child: movieController.isLoadingTop.value
                                      ? Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : ListView.builder(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: movieController
                                                  .movieTopModel
                                                  ?.results
                                                  .length ??
                                              0,
                                          itemBuilder: (context, index) {
                                            return MovieCard(
                                              title: movieController
                                                      .movieTopModel
                                                      ?.results[index]
                                                      .title ??
                                                  "no title",
                                              rating: movieController
                                                      .movieTopModel
                                                      ?.results[index]
                                                      .voteAverage
                                                      .toString() ??
                                                  "0",
                                              linkImage: movieController
                                                      .movieTopModel
                                                      ?.results[index]
                                                      .posterPath ??
                                                  "",
                                              id: movieController.movieTopModel
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
                                  "Comedy",
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
                                  child: movieController.isLoadingPopular.value
                                      ? Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : ListView.builder(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: movieController
                                                  .moviePopularModel
                                                  ?.results
                                                  .length ??
                                              0,
                                          itemBuilder: (context, index) {
                                            return MovieCard(
                                              title: movieController
                                                      .moviePopularModel
                                                      ?.results[index]
                                                      .title ??
                                                  "no title",
                                              rating: movieController
                                                      .moviePopularModel
                                                      ?.results[index]
                                                      .voteAverage
                                                      .toString() ??
                                                  "0",
                                              linkImage: movieController
                                                      .moviePopularModel
                                                      ?.results[index]
                                                      .posterPath ??
                                                  "",
                                              id: movieController
                                                      .moviePopularModel
                                                      ?.results[index]
                                                      .id ??
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
                                  "Popular in Poland",
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
                                  child: movieController.isLoading.value
                                      ? Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : ListView.builder(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: movieController
                                                  .movieModel?.results.length ??
                                              0,
                                          itemBuilder: (context, index) {
                                            return MovieCard(
                                              title: movieController.movieModel
                                                      ?.results[index].title ??
                                                  "no title",
                                              rating: movieController
                                                      .movieModel
                                                      ?.results[index]
                                                      .voteAverage
                                                      .toString() ??
                                                  "0",
                                              linkImage: movieController
                                                      .movieModel
                                                      ?.results[index]
                                                      .posterPath ??
                                                  "",
                                              id: movieController.movieModel
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
