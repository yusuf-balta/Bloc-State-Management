import 'package:firebase_bloc/bloc/film_service.dart';
import 'package:firebase_bloc/bloc/film_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilmCubit extends Cubit<FilmsState>{
  FilmsService filmsService;

  FilmCubit(this.filmsService):super(FilmsInitial());

  Future<void> getFilms() async {
    try{
      emit(FilmsLoading());
      final filmler= await filmsService.getFilms();
      emit(FilmsCompleted(filmler: filmler));

    }catch(e){

    }

  }
  Future<void> inital() async {
    try{
      emit(FilmsInitial());


    }catch(e){

    }

  }

}