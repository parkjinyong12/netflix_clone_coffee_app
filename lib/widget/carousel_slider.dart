import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_coffee_app/model/model_movie.dart';

class CarouselImage extends StatefulWidget {
  final List<Movie> movies;
  CarouselImage({this.movies});
  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {

  List<Movie> movies;
  List<Widget> images;
  List<String> keywords;
  List<bool> likes;
  int _currentPage = 0;
  String _currentKeyword;

  @override
  void initState() {
    super.initState();
    movies = widget.movies;
    images = movies.map((m) => Image.asset('images/' + m.poster, fit: BoxFit.fitWidth,)).toList();
    keywords = movies.map((m) => m.keyword).toList();
    likes = movies.map((m) => m.like).toList();
    _currentKeyword = keywords[0];
  }
   
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(25),
          ),
          CarouselSlider(
            items: images.map((i) {
              return Container(
                width: width,
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: i,                
              );
            }).toList(), 
            options: CarouselOptions(
              height: height * 0.45,
              autoPlay: true,
              enlargeCenterPage: true,
              autoPlayInterval: Duration(seconds: 5),
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                  _currentKeyword = keywords[_currentPage];
                });
              },
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
            child: Text(
              _currentKeyword, 
              style: TextStyle(fontSize: 11),
            ), 
          ),
          Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                       children: makeIndicator(likes, _currentPage),),
          ),
        ],
      ),
    );
  }
}

List<Widget> makeIndicator(List list, int _currentPage) {
  List<Widget> results = [];
  for (var i = 0; i < list.length; i++) {
    results.add(
      Container(
        width: 8, 
        height: 8, 
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        decoration: BoxDecoration(shape: BoxShape.circle, color: _currentPage == i 
                  ? Color.fromRGBO(255, 255, 255, 0.9) 
                  : Color.fromRGBO(255, 255, 255, 0.4)),
      )
    );
  }
  return results;
}