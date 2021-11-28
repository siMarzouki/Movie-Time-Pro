import '../widgets/data_table.dart';
import '../widgets/appbar.dart';
import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailsScreen extends StatefulWidget {
  final Movie movie;
  const MovieDetailsScreen(this.movie, {Key? key}) : super(key: key);

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var sz = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context, "Movie Time"),
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: sz.width * 0.07, vertical: sz.height * 0.012),
              child: Column(
                children: [
                  Image.network(
                    widget.movie.posterUrl,
                    height: sz.height * 0.5,
                  ),
                  SizedBox(
                    height: sz.height * 0.06,
                  ),
                  MovieDataTable(widget.movie)
                ],
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:
            Movie.checkMovieFavorite(widget.movie) ? Colors.pink : Colors.white,
        child: Icon(
          Icons.favorite,
          color: Movie.checkMovieFavorite(widget.movie)
              ? Colors.white
              : Colors.pink,
        ),
        onPressed: () {
          setState(() {
            if (!Movie.checkMovieFavorite(widget.movie)) {
              Movie.addMovieToFavorite(widget.movie);
            }
          });
        },
      ),
    );
  }
}
