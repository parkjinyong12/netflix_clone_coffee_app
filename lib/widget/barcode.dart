import 'package:flutter/material.dart';
import 'package:netflix_clone_coffee_app/model/model_movie.dart';

class BarCode extends StatelessWidget {

  final List<Movie> movies;
  BarCode({this.movies});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Text('지금 뜨는 콘텐츠'),
          // Container(
          //   padding: EdgeInsets.all(25),
          // ),
          Container(
            child: Image.asset('images/' + movies[0].poster)
          )
        ],),
    );
  }  
}