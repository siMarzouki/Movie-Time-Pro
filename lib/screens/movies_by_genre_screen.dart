import '../models/movie.dart';
import '../widgets/appbar.dart';
import 'package:flutter/material.dart';

import 'movie_details_screen.dart';

class MoviesByGenreScreen extends StatelessWidget {
  final String genre;
  final List<Movie> movies;
  const MoviesByGenreScreen(this.genre, this.movies, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sz = MediaQuery.of(context).size;
    return Scaffold(
        appBar: appBar(context, genre),
        backgroundColor: Colors.black,
        body: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 0.6,
            children: List.generate(movies.length, (i) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieDetailsScreen(movies[i])));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: sz.width * 0.025),
                  child: Column(
                    children: [
                      Image.network(
                        movies[i].posterUrl,
                        width: sz.width * 0.2,
                      ),
                      Container(
                        width: sz.width * 0.2,
                        margin: EdgeInsets.only(top: sz.height * 0.01),
                        child: Text(movies[i].title,
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
            })));
  }
}
