import 'package:get/get.dart';
import 'package:movie_it/models/movie_model.dart';

class MovieService extends GetConnect {
  static const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  static const BASE_URL = 'https://api.themoviedb.org/3';

  Future<Response> getNowPlayingMovies() =>
      get('$BASE_URL/movie/now_playing?$API_KEY');
}
