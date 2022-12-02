import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:movie_it/widget/background.dart';
import 'package:movie_it/widget/favoritemoviecard.dart';

class Favoritespage extends StatefulWidget {
  @override
  State<Favoritespage> createState() => _FavoritespageState();
}

class _FavoritespageState extends State<Favoritespage> {
  FocusNode focusNode = FocusNode();

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
                        padding: const EdgeInsets.symmetric(horizontal: 00),
                        child: Column(
                          children: [
                            FavoriteMovieCard(
                                title: "After",
                                rating: "9.1",
                                linkImage:
                                    "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/movie-poster-template-design-21a1c803fe4ff4b858de24f5c91ec57f_screen.jpg?ts=1636996180",
                                desc:
                                    "Film ini sangat baik dikarenakan ya baik bukan jelek, klu jelek ya film ini jelek. Sangat membantu bukan sinopsis ini. Semoga kalian tidak suka dengan film ini dikarenakan film dajjal ini"),
														FavoriteMovieCard(
                                title: "After",
                                rating: "9.1",
                                linkImage:
                                    "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/movie-poster-template-design-21a1c803fe4ff4b858de24f5c91ec57f_screen.jpg?ts=1636996180",
                                desc:
                                    "Film ini sangat baik dikarenakan ya baik bukan jelek, klu jelek ya film ini jelek. Sangat membantu bukan sinopsis ini. Semoga kalian tidak suka dengan film ini dikarenakan film dajjal ini"),
														FavoriteMovieCard(
                                title: "After",
                                rating: "9.1",
                                linkImage:
                                    "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/movie-poster-template-design-21a1c803fe4ff4b858de24f5c91ec57f_screen.jpg?ts=1636996180",
                                desc:
                                    "Film ini sangat baik dikarenakan ya baik bukan jelek, klu jelek ya film ini jelek. Sangat membantu bukan sinopsis ini. Semoga kalian tidak suka dengan film ini dikarenakan film dajjal ini"),


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

    return Scaffold();
  }
}
