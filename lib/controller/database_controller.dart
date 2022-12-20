import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class DatabaseController extends GetxController{
	Map listMovie = {};

	void writeDataMovie(String userId, int movieId) async{
		DatabaseReference ref = FirebaseDatabase.instance.ref().child("Users/$userId");
		ref.push().set({
			"movieId": movieId,
		});
		
	}

	void readDataMovie(String userId) {
		DatabaseReference ref = FirebaseDatabase.instance.ref("Users/$userId");
		ref.onValue.listen((DatabaseEvent event) {
			listMovie = event.snapshot.value as Map;
			update();
		});
		
		

	}

	
}
