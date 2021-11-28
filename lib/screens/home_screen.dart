import 'movie_details_screen.dart';
import '../data/genres_list.dart';
import 'package:flutter/material.dart';
import '../data/movies_list.dart';
import '../models/movie.dart';
import 'movies_by_genre_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

///getting the list of movies with specific genre
List<Movie> moviesByGenre(String genre, int count) {
  List<Movie> result = [];
  var index = 0;
  while (count > 0 && index < movies.length) {
    if (movies[index].genres.contains(genre)) {
      result.add(movies[index]);
      count--;
    }
    index++;
  }
  return result;
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> moviesSelection = [];
  @override
  Widget build(BuildContext context) {
    var sz = MediaQuery.of(context).size;
    return ListView.builder(
        itemCount: genres.length,
        itemBuilder: (ctx, idx) {
          moviesSelection = moviesByGenre(genres[idx], 20);
          return Container(
              padding: EdgeInsets.all(sz.width * 0.005),
              margin: EdgeInsets.all(sz.width * 0.005),
              color: Colors.black,
              child: SizedBox(
                height: sz.height * 0.32,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: sz.width * 0.06, right: sz.width * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            genres[idx],
                            style: TextStyle(
                                fontSize: sz.width * 0.05,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          TextButton(
                              onPressed: () {
                                var genreMovies = movies
                                    .where((element) =>
                                        element.genres.contains(genres[idx]))
                                    .toList();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MoviesByGenreScreen(
                                                genres[idx], genreMovies)));
                              },
                              child: Text(
                                "VIEW MORE",
                                style: TextStyle(
                                    fontSize: sz.width * 0.03,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white70),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: sz.height * 0.25,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: moviesSelection.length,
                        itemBuilder: (ctx, i) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MovieDetailsScreen(
                                          moviesByGenre(
                                              genres[idx], i + 1)[i])));
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: sz.width * 0.025),
                              child: Column(
                                children: [
                                  Image.network(
                                    moviesSelection[i].posterUrl,
                                    width: sz.width * 0.2,
                                  ),
                                  SizedBox(
                                    width: sz.width * 0.2,
                                    child: Text(moviesSelection[i].title,
                                        textAlign: TextAlign.center,
                                        maxLines: 3,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ));
        });
  }
}
