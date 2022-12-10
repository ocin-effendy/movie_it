import 'dart:convert';

MovieModel movieModelFromJson(String str) =>
    MovieModel.fromJson(json.decode(str));

String movieModelToJson(MovieModel data) => json.encode(data.toJson());

class MovieModel {
  MovieModel({
    required this.results,
  });

  List<Result> results;

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  DateTime releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}




// class MovieModel {
//   final List<int> genre_ids;
//   final String id;
//   final String original_language;
//   final String overview;
//   final String popularity;
//   final String poster_path;
//   final String release_date;
//   final String title;
//   final String vote_average;

//   MovieModel({
//     required this.genre_ids,
//     required this.id,
//     required this.original_language,
//     required this.overview,
//     required this.popularity,
//     required this.poster_path,
//     required this.release_date,
//     required this.title,
//     required this.vote_average,
//   });

//   factory MovieModel.createMovieModel(Map<String, dynamic> object) {
//     return MovieModel(
//         genre_ids: List<int>.from(object['genres_ids'].map((x) => x)),
//         id: object['id'].toString(),
//         original_language: object['original_language'],
//         overview: object['overview'],
//         popularity: object['popularity'].toString(),
//         poster_path: object['poster_path'],
//         release_date: object['release_date'],
//         title: object['title'],
//         vote_average: object['vote_average']);
//   }
// }

