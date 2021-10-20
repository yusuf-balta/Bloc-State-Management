class FilmModel {
  late String title,
      year,
      rated,
      released,
      runtime,
      genre,
      director,
      writer,
      actors,
      plot,
      language,
      country,
      awards,
      poster,
      metascore,
      imdbrating,
      imdbvotes,
      imdbid,
      type,
      response;

  late List<dynamic> images;



  FilmModel({
    required this.title,
    required this.year,
    required this.rated,
    required this.released,
    required this.runtime,
    required this.genre,
    required this.director,
    required this.writer,
    required this.actors,
    required this.plot,
    required this.language,
    required this.country,
    required this.awards,
    required this.poster,
    required this.metascore,
    required this.imdbrating,
    required this.imdbvotes,
    required this.imdbid,
    required this.type,
    required this.response,
    required this.images,
  });

  FilmModel.fromJson(Map<dynamic, dynamic> json) {
    title = json["Title"];
    year = json["Year"];
    rated = json["Rated"];
    released = json["Released"];
    runtime = json["Runtime"];
    genre = json["Genre"];
    director = json["Director"];
    writer = json["Writer"];
    actors = json["Actors"];
    plot = json["Plot"];
    language = json["Language"];
    country = json["Country"];
    awards = json["Poster"];
    metascore = json["Metascore"];
    imdbrating = json["imdbRating"];
    imdbvotes = json["imdbVotes"];
    imdbid = json["imdbID"];
    type = json["Type"];
    response = json["Response"];
    images = json["Images"];
  }
}
