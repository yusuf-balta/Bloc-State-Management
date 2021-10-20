import 'package:firebase_bloc/bloc/film_model.dart';
import 'package:firebase_database/firebase_database.dart';
abstract class FilmsService{
  Future<List<FilmModel>> getFilms();
}

class FilmService implements FilmsService{
  // verileri dbden çekiyoruz
  @override
   Future<List<FilmModel>> getFilms() async {
    final  firebaseDatabase=FirebaseDatabase.instance.reference();
    List<FilmModel> films=[];
    await firebaseDatabase.child("Filmler").once().then((DataSnapshot dataSnapshot) {
      List filmler= dataSnapshot.value as List;

      filmler.forEach((element) {
        var film =element as Map<dynamic,dynamic>;
        films.add(FilmModel.fromJson(film));
      });

    });

    return films;

  }


}
