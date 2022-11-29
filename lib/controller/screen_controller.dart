
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_it/pages/favorites_page.dart';
import 'package:movie_it/pages/film_page.dart';
import 'package:movie_it/pages/profile_page.dart';
import 'package:movie_it/pages/tv_shows_page.dart';

class ScreenController extends GetxController{
	var currentTab = 0;
	List<Widget> screen = [FilmPage(), TvShowsPage(), Favoritespage(), ProfilePage()];

	final PageStorageBucket bucket = PageStorageBucket();
	Widget currentScreen = FilmPage();

	void setCurrentScreen(Widget screen, var tab){
		currentScreen = screen;
		currentTab = tab;
		update();
	}
	
}
