import 'dart:convert';
import 'package:get/get.dart';
import 'package:movie_it/controller/auth_controller.dart';
import 'package:movie_it/controller/database_controller.dart';
import 'package:movie_it/models/movie_detail_model.dart';
import 'package:movie_it/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:movie_it/models/movie_popular_model.dart';
import 'package:movie_it/models/movie_top_model.dart';

class MovieController extends GetxController {
  static const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  static const BASE_URL = 'https://api.themoviedb.org/3';
  MovieModel? movieModel;
  MoviePopularModel? moviePopularModel;
  MovieTopModel? movieTopModel;
  MovieDetail? movieDetail;
  var isLoading = false.obs;
  var isLoadingPopular = false.obs;
  var isLoadingTop = false.obs;
  var isLoadingDetail = false.obs;

  final dbC = Get.find<DatabaseController>();
  final authC = Get.find<AuthController>();

  void fetchDataMovies() async {
    try {
      isLoading(true);
      http.Response response =
          await http.get(Uri.tryParse('$BASE_URL/movie/now_playing?$API_KEY')!);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        movieModel = MovieModel.fromJson(result);
      } else {
        print("Error Fetching Data");
      }
    } catch (e) {
      e.printError();
    } finally {
      isLoading(false);
    }
  }

  void fetchDataPopularMovie() async {
    try {
      isLoadingTop(true);
      http.Response response =
          await http.get(Uri.tryParse('$BASE_URL/movie/top_rated?$API_KEY')!);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        movieTopModel = MovieTopModel.fromJson(result);
      } else {
        print("Error Fetching Data");
      }
    } catch (e) {
      e.printError();
    } finally {
      isLoadingPopular(false);
    }
  }

  void fetchDataTopMovie() async {
    try {
      isLoadingTop(true);
      http.Response response =
          await http.get(Uri.tryParse('$BASE_URL/movie/popular?$API_KEY')!);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        moviePopularModel = MoviePopularModel.fromJson(result);
      } else {
        print("Error Fetching Data");
      }
    } catch (e) {
      e.printError();
    } finally {
      isLoadingTop(false);
    }
  }

  void fetchDataDetailMovie(int id) async {
    try {
      isLoadingDetail(true);
      http.Response response =
          await http.get(Uri.tryParse('$BASE_URL/movie/$id?$API_KEY')!);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        movieDetail = MovieDetail.fromJson(result);
        dbC.getIdMovie(authC.getUserId(), id);
      } else {
        print("Error Fetching Data");
      }
    } catch (e) {
      e.printError();
    } finally {
      isLoadingDetail(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchDataMovies();
    fetchDataPopularMovie();
    fetchDataTopMovie();
  }
}
