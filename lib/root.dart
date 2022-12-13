import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_it/controller/screen_controller.dart';
import 'package:movie_it/pages/favorites_page.dart';
import 'package:movie_it/pages/film_page.dart';
import 'package:movie_it/pages/profile_page.dart';
import 'package:movie_it/pages/tv_shows_page.dart';

class Root extends StatelessWidget {
  Root({Key? key}) : super(key: key);
  final screenController = Get.put(ScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ScreenController>(
        init: screenController,
        builder: (controller) => PageStorage(
          bucket: controller.bucket,
          child: controller.currentScreen,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [
                Color.fromRGBO(210, 32, 60, 1),
                Color.fromRGBO(86, 66, 212, 1),
              ])),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle)),
                  Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle)),
                  Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle)),
                ],
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: GetBuilder<ScreenController>(
        init: ScreenController(),
        builder: (controller) => Container(
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
            color: Colors.blueGrey,
          ))),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black,
              unselectedItemColor: Colors.grey[700],
              selectedItemColor: Colors.grey[400],
              currentIndex: controller.currentTab,
              onTap: (int i) {
                if (i == 0) {
                  controller.setCurrentScreen(FilmPage(), 0);
                } else if (i == 1) {
                  controller.setCurrentScreen(TvShowsPage(), 1);
                } else if (i == 2) {
                  controller.setCurrentScreen(Favoritespage(), 2);
                } else if (i == 3) {
                  controller.setCurrentScreen(ProfilePage(), 3);
                }
              },
              items: [
                BottomNavigationBarItem(
                    icon: controller.currentTab == 0
                        ? const Icon(Icons.video_camera_back_rounded)
                        : const Icon(
                            Icons.video_camera_back_outlined,
                          ),
                    label: "Films"),
                BottomNavigationBarItem(
                  icon: controller.currentTab == 1
                      ? const Icon(Icons.live_tv_rounded)
                      : const Icon(Icons.live_tv_outlined),
                  label: "Tv Shows",
                ),
                BottomNavigationBarItem(
                  icon: controller.currentTab == 2
                      ? const Icon(Icons.bookmark_rounded)
                      : const Icon(Icons.bookmark_border_outlined),
                  label: "Favorites",
                ),
                BottomNavigationBarItem(
                  icon: controller.currentTab == 3
                      ? const Icon(Icons.account_circle_rounded)
                      : const Icon(Icons.account_circle_outlined),
                  label: "Profile",
                ),
              ]),
        ),
      ),
    );
  }
}
