import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 0),
          title: Text(
            "Google And Ubuntu Join Forces To Make Desktop Linux Even Better",
            style: TextStyle(
                fontFamily: 'Merriweather',
                fontWeight: FontWeight.w600,
                fontSize: 14),
          ),
          subtitle: Text(
            "Forbes | Jason Evangelho",
            style: TextStyle(
              fontFamily: 'Merriweather',

              fontWeight: FontWeight.w600,
              //color: Colors.black
            ),
          ),
          trailing: GestureDetector(
            onTap: () {
              print("Got clicked");
            },
            child: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          //isThreeLine: true,

          dense: true,
        );
      },
      separatorBuilder: (BuildContext context, int index) => Divider(height: 5),
    );
  }
}
