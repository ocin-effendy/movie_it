import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_it/controller/screen_controller.dart';
import 'package:movie_it/pages/favorites_page.dart';
import 'package:movie_it/pages/film_page.dart';
import 'package:movie_it/pages/profile_page.dart';
import 'package:movie_it/pages/tv_shows_page.dart';

class Root extends StatelessWidget{
  const Root({Key? key}) : super(key: key);

	@override
	  Widget build(BuildContext context) {
			return Scaffold(
				body: GetBuilder<ScreenController>(
					init: ScreenController(),
					builder: (controller) => PageStorage(
						bucket: controller.bucket,
						child: controller.currentScreen,
					),
				),
				floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
				floatingActionButton: FloatingActionButton(
					onPressed: (){},
					backgroundColor: Colors.lightBlueAccent,
					child: const Icon(Icons.add),
					

				),
				bottomNavigationBar: GetBuilder<ScreenController>(
					init: ScreenController(),
				  builder: (controller) => BottomNavigationBar(
				  	type: BottomNavigationBarType.fixed,
				  	backgroundColor: Colors.black,
				  	unselectedItemColor: Colors.grey[700],
				  	selectedItemColor: Colors.grey[400],
						currentIndex: controller.currentTab,

						onTap: (int i ){
							if(i == 0) {
								controller.setCurrentScreen(FilmPage(), 0);
							}else if(i == 1) {
								controller.setCurrentScreen(TvShowsPage(), 1);
							}else if(i == 2){
								controller.setCurrentScreen(Favoritespage(), 2);
							}else if(i == 3) {
								controller.setCurrentScreen(ProfilePage(), 3);
							}
							
						},
				  	items: [
				  		BottomNavigationBarItem(
				  			icon: controller.currentTab == 0 ? const Icon(Icons.video_camera_back_rounded) : const Icon(Icons.video_camera_back_outlined,),
				  			label: "Films"
				  		),
				  		BottomNavigationBarItem(
				  			icon: controller.currentTab == 1 ? const Icon(Icons.live_tv_rounded) : const Icon(Icons.live_tv_outlined) ,
				  			label: "Tv Shows",
				  		),
				  		BottomNavigationBarItem(
				  			icon: controller.currentTab == 2 ? const Icon(Icons.bookmark_rounded) : const Icon(Icons.bookmark_border_outlined) ,
				  			label: "Tv Shows",
				  		),
				  		BottomNavigationBarItem(
				  			icon: controller.currentTab == 3 ? const Icon(Icons.account_circle_rounded) : const Icon(Icons.account_circle_outlined),
				  			label: "Tv Shows",
				  		),
				  	]
				  ),
				),
			);
	  }
}
