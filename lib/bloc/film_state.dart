import 'package:firebase_bloc/bloc/film_model.dart';

abstract class FilmsState {}

class FilmsInitial extends FilmsState{
}

class FilmsLoading extends FilmsState {}

class FilmsCompleted extends FilmsState {
  final List<FilmModel> filmler;
  FilmsCompleted({required this.filmler});
}


class FilmsError extends FilmsState {
  final String message;
  FilmsError({required this.message});
}
