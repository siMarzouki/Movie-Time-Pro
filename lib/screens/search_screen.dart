import 'package:flutter/material.dart';
import '../data/movies_list.dart';
import 'movie_details_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchKeyword = TextEditingController();
  var matchedMovies = [];
  @override
  Widget build(BuildContext context) {
    var sz = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: [
              Image.asset(
                "assets/logo.png",
                width: sz.width * 0.088,
              ),
              SizedBox(
                width: sz.width * 0.035,
              ),
              const Text("Search")
            ],
          ),
        ),
        backgroundColor: Colors.black,
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(sz.width * 0.025),
              color: const Color.fromRGBO(30, 30, 30, 1),
              child: TextField(
                controller: searchKeyword,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    labelText: "Type a keyword",
                    labelStyle: TextStyle(color: Colors.lightBlue)),
              ),
            ),
            Container(
              margin: EdgeInsets.all(sz.width * 0.03),
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      matchedMovies = movies
                          .where((element) => element.title
                              .toUpperCase()
                              .contains(searchKeyword.text.toUpperCase()))
                          .toList();
                    });
                  },
                  child: Text(
                    "Search Movies",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  style: TextButton.styleFrom(backgroundColor: Colors.blue)),
            ),
            SizedBox(
              child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  childAspectRatio: 0.6,
                  children: List.generate(matchedMovies.length, (i) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MovieDetailsScreen(matchedMovies[i])));
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: sz.width * 0.025),
                        child: Column(
                          children: [
                            Image.network(
                              matchedMovies[i].posterUrl,
                              width: sz.width * 0.2,
                            ),
                            SizedBox(
                              width: sz.width * 0.2,
                              child: Text(matchedMovies[i].title,
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
                  })),
            )
          ],
        ));
  }
}
