import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class DatabaseController extends GetxController {
  List listMovieId = [];
  var getStatusMovie = false.obs;

  void writeDataMovie(String userId, int movieId, String title, String rating,
      String linkImage, String desc) async {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref().child("Users/$userId");
    ref.push().set({
      "movieId": movieId,
      "title": title,
      "rating": rating,
      "linkImage": linkImage,
      "desc": desc
    });
  }

  void readDataMovie(String userId) {
    listMovieId = [];
    DatabaseReference ref = FirebaseDatabase.instance.ref("Users/$userId");
    ref.once().then((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> values = event.snapshot.value as Map;
        values.forEach((key, values) {
          if (!listMovieId.contains(values['movieId'])) {
            listMovieId.add({
              "movieId": values['movieId'],
              "title": values['title'],
              "rating": values['rating'],
              "linkImage": values['linkImage'],
              "desc": values['desc'],
            });
          }
        });
        update();
      }
    });
  }

  void getIdMovie(String userId, int movieId) {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref().child("Users/$userId");

    ref.once().then((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> values = event.snapshot.value as Map;
        values.forEach((key, values) {
          if (values['movieId'] == movieId) {
            getStatusMovie(true);
          }
        });
      }
    });
  }

  void deleteMovie(String userId, int movieId) {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref().child("Users/$userId");
    ref.once().then((DatabaseEvent event) {
      Map<dynamic, dynamic> values = event.snapshot.value as Map;
      values.forEach((key, value) {
        if (value['movieId'] == movieId) {
          ref.child(key).remove();
        }
      });
    });
  }

  void deleteMovieInList(int movieId) {
    for (int i = 0; i < listMovieId.length; i++) {
      if (listMovieId[i]['movieId'] == movieId) {
        listMovieId.removeAt(i);
        break;
      }
    }
    update();
  }
}
