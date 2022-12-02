import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_it/controller/screen_controller.dart';
import 'package:movie_it/pages/film_page.dart';
import 'package:movie_it/pages/tv_shows_page.dart';
import 'package:movie_it/widget/background.dart';

class DetailMovie extends StatelessWidget {

	final screenController = Get.find<ScreenController>();
	@override
	  Widget build(BuildContext context) {
			return Scaffold(
				body: SafeArea(
					child: Stack(
						children: [
							const Background(),
							IconButton(
								onPressed: (){
									if(screenController.currentTab == 0){
										screenController.setCurrentScreen(FilmPage(), screenController.currentTab);
									}else if(screenController.currentTab == 1){
										screenController.setCurrentScreen(TvShowsPage(), screenController.currentTab);
									}
								}, 
								icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white,))
						],

					),
				),

			);
	  }
  
}
