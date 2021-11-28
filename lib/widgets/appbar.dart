import '../screens/search_screen.dart';
import 'package:flutter/material.dart';

AppBar appBar(BuildContext ctx, String title) {
  var sz = MediaQuery.of(ctx).size;
  return AppBar(
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
        Text(title)
      ],
    ),
    actions: [
      IconButton(
          onPressed: () {
            Navigator.push(ctx,
                MaterialPageRoute(builder: (context) => const SearchScreen()));
          },
          icon: const Icon(Icons.search))
    ],
  );
}
