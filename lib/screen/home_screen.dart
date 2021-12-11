import 'package:netflix_clone_coffee_app/model/model_movie.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_coffee_app/widget/carousel_slider.dart';
import 'package:netflix_clone_coffee_app/widget/top_bar.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {  

  List<Movie> movies = [
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'test_movie_1.png',
      'like': false
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'test_movie_1.png',
      'like': false
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'test_movie_1.png',
      'like': false
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'test_movie_1.png',
      'like': false
    }),
  ];
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(25),
      children: <Widget>[
        Stack(
          children: <Widget>[
            CarouselImage(movies: movies), 
            TopBar(),            
          ],
        ),
      ],
    );  
  }  
}