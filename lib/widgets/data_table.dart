import '../data/genres_list.dart';
import '../models/movie.dart';
import 'package:flutter/material.dart';

Padding tableElement(String txt, TextStyle? style, double pad) {
  return Padding(
    padding: EdgeInsets.all(pad),
    child: Text(
      txt,
      style: style,
    ),
  );
}

class MovieDataTable extends StatelessWidget {
  final Movie movie;
  const MovieDataTable(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sz = MediaQuery.of(context).size;
    return Table(
      columnWidths: const {0: FractionColumnWidth(0.25)},
      border: TableBorder.all(color: Colors.white),
      children: [
        TableRow(children: [
          tableElement(
              "Title", Theme.of(context).textTheme.headline1, sz.width * 0.02),
          tableElement(movie.title, Theme.of(context).textTheme.bodyText1,
              sz.width * 0.02),
        ]),
        TableRow(children: [
          tableElement(
              "Genres", Theme.of(context).textTheme.headline1, sz.width * 0.02),
          Padding(
              padding: EdgeInsets.all(sz.width * 0.02),
              child: RichText(
                  text: TextSpan(
                      children: List.generate(movie.genres.length, (index) {
                return TextSpan(
                    text: " ${movie.genres[index]} ",
                    style: TextStyle(
                        color:
                            genreColors[genres.indexOf(movie.genres[index])]));
              }))))
        ]),
        TableRow(children: [
          tableElement("Release Date", Theme.of(context).textTheme.headline1,
              sz.width * 0.02),
          tableElement(
              DateTime.fromMillisecondsSinceEpoch(movie.releaseDate * 1000)
                  .toString()
                  .substring(0, 10),
              Theme.of(context).textTheme.bodyText2,
              sz.width * 0.02),
        ]),
        TableRow(children: [
          tableElement("Overview", Theme.of(context).textTheme.headline1,
              sz.width * 0.02),
          tableElement(movie.overview, Theme.of(context).textTheme.bodyText2,
              sz.width * 0.02),
        ]),
      ],
    );
  }
}
