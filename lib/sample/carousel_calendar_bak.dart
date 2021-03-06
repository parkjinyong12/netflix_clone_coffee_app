import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;

import 'package:flutter/material.dart';
import 'package:netflix_clone_coffee_app/model/model_movie.dart';

import 'package:intl/intl.dart' show DateFormat;

class CarouselCalendar extends StatefulWidget {
  final List<Movie> movies;
  CarouselCalendar({this.movies});
  _CarouselCalendarState createState() => _CarouselCalendarState();
}

class _CarouselCalendarState extends State<CarouselCalendar> {

  DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();
  String _currentMonth = DateFormat('yyyy년 MM월').format(DateTime.now());
  DateTime _targetDateTime = DateTime(2019, 2, 3);
  //  List<DateTime> _markedDate = [DateTime(2018, 9, 20), DateTime(2018, 10, 11)];
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

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
      new DateTime(2020, 10, 10): [
        new Event(
          date: new DateTime(2020, 10, 10),
          title: 'Event 1',
          icon: _eventIcon,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.red,
            height: 5.0,
            width: 5.0,
          ),
        ),
        new Event(
          date: new DateTime(2020, 10, 10),
          title: 'Event 2',
          icon: _eventIcon,
        ),
        new Event(
          date: new DateTime(2020, 10, 10),
          title: 'Event 3',
          icon: _eventIcon,
        ),
      ],
    },
  );
  
  CalendarCarousel _calendarCarousel, _calendarCarouselNoHeader;

  @override
  void initState() {

    /// Add more events to _markedDateMap EventList
    _markedDateMap.add(
        new DateTime(2020, 10, 25),
        new Event(
          date: new DateTime(2020, 10, 25),
          title: 'Event 5',
          icon: _eventIcon,
        ));

    _markedDateMap.add(
        new DateTime(2020, 10, 10),
        new Event(
          date: new DateTime(2020, 10, 10),
          title: 'Event 4',
          icon: _eventIcon,
        ));

    _markedDateMap.addAll(new DateTime(2020, 10, 11), [
      new Event(
        date: new DateTime(2020, 10, 11),
        title: 'Event 1',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(2020, 10, 11),
        title: 'Event 2',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(2020, 10, 11),
        title: 'Event 3',
        icon: _eventIcon,
      ),
    ]);
    super.initState();    
  }
   
  @override
  Widget build(BuildContext context) {

    // 일주일치 달력 설정 모음
    _calendarCarousel = CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate = date);
        events.forEach((event) => print(event.title));
      },
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      thisMonthDayBorderColor: Colors.grey,
  //          weekDays: null, /// for pass null when you do not want to render weekDays
      headerText: 'Custom Header',
      weekFormat: true,
      markedDatesMap: _markedDateMap,
      height: 200.0,
      selectedDateTime: _currentDate2,
      showIconBehindDayText: true,
  //          daysHaveCircularBorder: false, /// null for not rendering any border, true for circular border, false for rectangular border
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateShowIcon: true,
      markedDateIconMaxShown: 2,
      selectedDayTextStyle: TextStyle(
        color: Colors.yellow,
      ),
      todayTextStyle: TextStyle(
        color: Colors.blue,
      ),
      markedDateIconBuilder: (event) {
        return event.icon;
      },
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      todayButtonColor: Colors.transparent,
      todayBorderColor: Colors.green,
      markedDateMoreShowTotal:
          true, // null for not showing hidden events indicator
  //          markedDateIconMargin: 9,
  //          markedDateIconOffset: 3,
    );

    // 한달치 달력 설정 모음
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: Colors.green,
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate2 = date);
        events.forEach((event) => print(event.title));
      },
      // daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: false,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      // 요일 헤더 색상
      weekdayTextStyle: TextStyle(
        color: Colors.white,
      ),   
      thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
//      firstDayOfWeek: 4,
      markedDatesMap: _markedDateMap,
      height: 420.0,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder: CircleBorder(
        side: BorderSide(color: Colors.white12, width: 30)
      ),
      markedDateCustomTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.blue,
      ),
      showHeader: false,
      todayTextStyle: TextStyle(
        color: Colors.blue,
      ),
      // markedDateShowIcon: true,
      // markedDateIconMaxShown: 2,
      // markedDateIconBuilder: (event) {
      //   return event.icon;
      // },
      // markedDateMoreShowTotal:
      //     true,
      todayButtonColor: Colors.yellow,
      selectedDayTextStyle: TextStyle(
        color: Colors.yellow,
      ),
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      // 전월 날짜들
      prevDaysTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
      daysTextStyle: TextStyle(
        color: Colors.white,
      ),
      inactiveDaysTextStyle: TextStyle(
        color: Colors.tealAccent,
        fontSize: 16,
      ),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat('yyyy년 MM월').format(_targetDateTime);
          
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );
    return new Scaffold(        
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              
              // 일주일치 달력 
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 16.0),
              //   child: _calendarCarousel,
              // ), // This trailing comma makes auto-formatting nicer for build methods.
              
              // 한달치 달력 헤더
              // Container(
              //   margin: EdgeInsets.only(
              //     top: 30.0,
              //     bottom: 16.0,
              //     left: 16.0,
              //     right: 16.0,
              //   ),
              //   child: new Row(
              //     children: <Widget>[
              //       Expanded(
              //           child: Text(
              //         _currentMonth,
              //         style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           fontSize: 24.0,
              //         ),
              //       )),
              //       FlatButton(
              //         child: Text('PREV'),
              //         onPressed: () {
              //           setState(() {
              //             _targetDateTime = DateTime(_targetDateTime.year, _targetDateTime.month -1);
              //             _currentMonth = DateFormat('yyyy년 MM월').format(_targetDateTime);
              //           });
              //         },
              //       ),
              //       FlatButton(
              //         child: Text('NEXT'),
              //         onPressed: () {
              //           setState(() {
              //             _targetDateTime = DateTime(_targetDateTime.year, _targetDateTime.month +1);
              //             _currentMonth = DateFormat('yyyy년 MM월').format(_targetDateTime);
              //           });
              //         },
              //       )
              //     ],
              //   ),
              // ),

              // 한달치 달력 메인
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: _calendarCarouselNoHeader,
              ), 
            ],
          ),
        ));
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