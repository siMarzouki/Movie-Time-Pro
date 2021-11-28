import 'package:app8/models/movie.dart';
import 'package:flutter/material.dart';
import '../data/genres_list.dart';
import 'movie_details_screen.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favMovies = Movie.getFavoriteMovies();
    var sz = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: favMovies.length,
      itemBuilder: (context, idx) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MovieDetailsScreen(favMovies[idx])));
          },
          child: Container(
            height: sz.height * 0.15,
            margin: EdgeInsets.symmetric(
                horizontal: sz.width * 0.025, vertical: sz.height * 0.012),
            child: Row(
              children: [
                Image.network(
                  favMovies[idx].posterUrl,
                  width: sz.width * 0.25,
                ),
                SizedBox(
                  width: sz.width * 0.65,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          favMovies[idx].title,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Text(
                        DateTime.fromMillisecondsSinceEpoch(
                                favMovies[idx].releaseDate * 1000)
                            .toString()
                            .substring(0, 4),
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      RichText(
                          text: TextSpan(
                              children: List.generate(
                                  favMovies[idx].genres.length, (index) {
                        return TextSpan(
                            text: " ${favMovies[idx].genres[index]} ",
                            style: TextStyle(
                                color: genreColors[genres
                                    .indexOf(favMovies[idx].genres[index])]));
                      })))
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
