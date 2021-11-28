import 'package:flutter/services.dart';

import './widgets/appbar.dart';
import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './screens/watchlist_screen.dart';
import './screens/genres_screen.dart';
import './models/movie.dart';

void main() {
  //locking orientaiton
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]).then((_) {
    //add it here
    Movie.getFavMoviesFromSharedPreferences();
    //
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Movie Time',
        theme: ThemeData(
            textTheme: const TextTheme(
          headline1: TextStyle(color: Colors.white, fontSize: 16),
          bodyText1: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          bodyText2: TextStyle(color: Colors.white, fontSize: 16),
        )),
        debugShowCheckedModeBanner: false,
        home: const MainScreen());
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _currentIndex = 0;
  final _homeViews = const [HomeScreen(), GenresScreen(), WatchListScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Movie Time'),
      backgroundColor: Colors.black54,
      body: _homeViews[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: const Color.fromRGBO(20, 20, 20, 1),
        unselectedItemColor: Colors.white,
        onTap: (val) {
          setState(() {
            _currentIndex = val;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined), label: "Explore"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: "Watchlist"),
        ],
      ),
    );
  }
}
