import 'package:flutter/material.dart';
import '../data/movies_list.dart';
import '../data/genres_list.dart';
import './movies_by_genre_screen.dart';

class GenresScreen extends StatelessWidget {
  const GenresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sz = MediaQuery.of(context).size;
    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        children: List.generate(genres.length, (index) {
          return GestureDetector(
            onTap: () {
              var genreMovies = movies
                  .where((element) => element.genres.contains(genres[index]))
                  .toList();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MoviesByGenreScreen(genres[index], genreMovies)));
            },
            child: Container(
              decoration: BoxDecoration(
                  color: genreColors[index],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(sz.width * 0.06),
                      bottomLeft: Radius.circular(sz.width * 0.06))),
              margin: EdgeInsets.all(sz.width * 0.06),
              padding: EdgeInsets.all(sz.width * 0.025),
              alignment: Alignment.center,
              child: FittedBox(
                child: Text(
                  genres[index],
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
          );
        }));
  }
}
