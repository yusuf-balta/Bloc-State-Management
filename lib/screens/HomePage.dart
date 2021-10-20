
import 'package:firebase_bloc/bloc/film_cuibt.dart';
import 'package:firebase_bloc/bloc/film_model.dart';
import 'package:firebase_bloc/bloc/film_service.dart';
import 'package:firebase_bloc/bloc/film_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {

   return BlocProvider(
     create: (context)=>FilmCubit(FilmService()),
     child: buildScafflod(context),

   );
  }

 Widget buildScafflod(BuildContext context){

  return Scaffold(

     appBar: AppBar(title: Text("Bloc State"),),
     body: BlocBuilder<FilmCubit,FilmsState>(
       builder: (context,state){
         if(state is FilmsInitial){
           return buildFilmInitial(context);

         }
         else if(state is FilmsLoading){
           return buildFilmLoading(context);

         }
         else if(state is FilmsCompleted){
           return buildFilmCompleted(state);

         }else{
           return buildFilmError();

         }

       },
     ),

   );
 }

  Widget buildFilmInitial(BuildContext context,) {
    return Center(
      child: Column(
        children: [Text("Hello"), buildFloatingActionButtonCall(context)],
      ),
    );

  }

  Widget buildFilmLoading(BuildContext context) {
    return Center(child: CircularProgressIndicator(),);

  }

  Widget buildFilmCompleted(FilmsCompleted state) {
    return ListView.builder(
      itemCount: state.filmler.length,
        itemBuilder: (context,index){
      FilmModel film=state.filmler[index];
      return _Card(film,context);
    });

  }

  Widget buildFilmError() {
    return Text("Hata Var");

  }

  FloatingActionButton buildFloatingActionButtonCall(BuildContext context,) {
    return FloatingActionButton(
      child: Icon(Icons.clear_all),
      onPressed: () {
        context.read<FilmCubit>().getFilms();


      },
    );
  }

  Widget _Card(FilmModel film,BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:15.0),
      child: Card(
        child: Column(
          children: [
            Text("Film Adı : ${film.title}"),
            Text("Türü : ${film.type}"),
            Text("Yayınlanma Tarihi : ${film.year}"),
            Text("Puanı : ${film.imdbrating}"),
            GestureDetector(
                onTap: (){context.read<FilmCubit>().inital();},
                child: Image.network(film.images[0])),


          ],
        ),
      ),
    );
  }
}
