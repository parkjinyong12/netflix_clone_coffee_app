import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_coffee_app/model/model_movie.dart';

class TopBar extends StatefulWidget {
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {

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
  
  List<Widget> images;
  List<String> keywords;
  List<Text> txtKeywords;
  List<bool> likes;
  int _currentPage = 0;
  String _currentKeyword;

  @override
  void initState() {
    super.initState();
    images = movies.map((m) => Image.asset('images/' + m.poster)).toList();
    txtKeywords = movies.map((m) => Text(m.keyword)).toList();
    keywords = movies.map((m) => m.keyword).toList();
    likes = movies.map((m) => m.like).toList();
    _currentKeyword = keywords[0];
  }
   
  @override
  Widget build(BuildContext context) {   
    final double width = MediaQuery.of(context).size.width; 
    return Container(
      child: Column(        
        children: <Widget>[        
          CarouselSlider(
            items: ['서버점검 안내입니다','이벤트 당첨자발표','마이페이지 이용방법'].map((m) {
              return Container(
                width: width,
                // margin: EdgeInsets.symmetric(horizontal: 30),
                child: Text('$m'),
                alignment: Alignment.centerLeft,
              );
            }).toList(),            
            options: CarouselOptions(
              scrollDirection: Axis.vertical,
              height: 45,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                  _currentKeyword = keywords[_currentPage];
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}