import 'package:netflix_clone_coffee_app/model/model_movie.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_coffee_app/widget/carousel_calendar.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:netflix_clone_coffee_app/widget/top_bar.dart';

class CouponScreen extends StatefulWidget {
  _CouponScreenState createState() => _CouponScreenState();
}

class _CouponScreenState extends State<CouponScreen> {  

  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: new Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );
  EventList<Event> events = new EventList<Event>(
    events: {
      new DateTime(2020, 10, 10): [
        new Event(
          date: new DateTime(2020,10,10,13,45,32),
          title: '사용완료',
          icon: _eventIcon,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.red,
            height: 5.0,
            width: 5.0,
          ),
        ),
        new Event(
          date: new DateTime(2020,10,10,15,21,11),
          title: '사용완료',
          icon: _eventIcon,
        ),
        new Event(
          date: new DateTime(2020,10,10,19,32,59),
          title: '사용완료',
          icon: _eventIcon,
        ),
      ],
    },
  ); 

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
    events.add(
      new DateTime(2020, 10, 25),
      new Event(
        date: new DateTime(2020,10,25,09,45,32),
        title: '사용완료',
        icon: _eventIcon,
      ));

    events.add(
        new DateTime(2020, 10, 10),
        new Event(
          date: new DateTime(2020,10,10,23,11,32),
          title: '사용완료',
          icon: _eventIcon,
        ));

    events.addAll(new DateTime(2020, 10, 11), [      
      new Event(
        date: new DateTime(2020,10,11,18,01,01),
        title: '사용완료',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(2020,10,11,18,45,01),
        title: '사용완료',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(2020,10,11,21,59,32),
        title: '사용완료',
        icon: _eventIcon,
      ),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            CarouselCalendar(events: events, movies: movies),
            TopBar()       
          ],
        ),  
      ],
    );  
  }  
}