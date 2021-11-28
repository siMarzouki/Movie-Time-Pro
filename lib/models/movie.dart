import 'package:app8/data/movies_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Movie {
  int id;
  String title;
  String posterUrl;
  String overview;
  int releaseDate;
  List<String> genres;
  static final List<Movie> _favoriteMovies = [];

  static const String favMoviesKey = 'favMovies';

  Movie(this.id, this.title, this.posterUrl, this.overview, this.releaseDate,
      this.genres);

  static List<String> favMoviesIds = [];
  static void getFavMoviesFromSharedPreferences() async {
    //1
    final prefs = await SharedPreferences.getInstance();
    //2
    if (prefs.containsKey(favMoviesKey)) {
      //3
      favMoviesIds = prefs.getStringList(favMoviesKey)!;
      //4
      for (String id in favMoviesIds) {
        _favoriteMovies
            .add(movies.firstWhere((movie) => movie.id.toString() == id));
      }
    }
  }

  static void addMovieToFavorite(Movie m) async {
    //1
    final prefs = await SharedPreferences.getInstance();
    //2
    favMoviesIds.add(m.id.toString());
    //3
    prefs.setStringList(favMoviesKey, favMoviesIds);
    _favoriteMovies.add(m);
  }

  static bool checkMovieFavorite(Movie m) {
    return _favoriteMovies.contains(m);
  }

  static List<Movie> getFavoriteMovies() {
    return _favoriteMovies;
  }
}
