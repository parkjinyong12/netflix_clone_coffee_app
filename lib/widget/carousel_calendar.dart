import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:netflix_clone_coffee_app/model/model_movie.dart';
import 'package:netflix_clone_coffee_app/widget/barcode.dart';
import 'package:netflix_clone_coffee_app/widget/coupon_uselist.dart';

class CarouselCalendar extends StatefulWidget {
  final EventList<Event> events;
  final List<Movie> movies;
  CarouselCalendar({this.events, this.movies});
  _CarouselCalendarState createState() => _CarouselCalendarState();
}

class _CarouselCalendarState extends State<CarouselCalendar> {
  EventList<Event> events;
  List<Movie> movies;  
  // DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();
  // String _currentMonth = DateFormat.yMMM().format(DateTime(2019, 2, 3));
  DateTime _targetDateTime = DateTime.now();
  CalendarCarousel _calendarCarousel;
  
  // 추가
  final TextEditingController _filter = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _searchText = "";

  _CarouselCalendarState() {
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
      });
    });
  }

  void initState() {
    events = widget.events;
    movies = widget.movies;   
    super.initState();
  }

  Widget _buildBody(BuildContext context) {
    return Builder(builder: (context) {
      String now_date = DateFormat.yMd().format(DateTime.now());
      String selected_date = DateFormat.yMd().format(_currentDate2);
      if(now_date == selected_date) {
        return BarCode(movies: movies);
      } else {
        return CouponUseList(events: events,selected_date: _currentDate2);
      }
      // ym.format(DateTime.now())
      
    });
  }
  @override
  Widget build(BuildContext context) {
    
    // 옵션
    _calendarCarousel = CalendarCarousel<Event>(
      // todayBorderColor: Colors.green,
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate2 = date);
        print(_currentDate2);
        events.forEach((event) => print(event.title));
        // Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        //   return BarCode(movies: movies);
        // }));
        
      },
      // daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: false,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      weekdayTextStyle: TextStyle(
        color: Colors.white,
      ), 
      thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
      // firstDayOfWeek: 4,
      markedDatesMap: events,
      height: 270.0,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      // markedDateCustomShapeBorder: CircleBorder(
      //   side: BorderSide(color: Colors.white24, width: 30)
      // ),
      markedDateCustomTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.blue,
      ),
      showHeader: false,
      todayTextStyle: TextStyle(
        color: Colors.black,
      ),
      // markedDateShowIcon: true,
      // markedDateIconMaxShown: 2,
      // markedDateIconBuilder: (event) {
      //   return event.icon;
      // },
      // markedDateMoreShowTotal:
      //     true,
      todayButtonColor: Colors.white,
      selectedDayTextStyle: TextStyle(
        color: Colors.black,
      ),
      selectedDayButtonColor: Colors.white,
      minSelectedDate: _currentDate2.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate2.add(Duration(days: 360)),
      // 저번달 날짜들
      prevDaysTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
      // 이달의 날짜들
      daysTextStyle: TextStyle(
        color: Colors.white,
      ),
      // 다음달 날짜들
      nextDaysTextStyle: TextStyle(
        color: Colors.black,
      ),
      inactiveDaysTextStyle: TextStyle(
        color: Colors.tealAccent,
        fontSize: 16,
      ),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;          
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );

    return Container(              
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(25),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: _calendarCarousel,
          ), 
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                child: Text('사용할 바코드 보이기', style: TextStyle(color: Colors.white),),
                color: Colors.white24,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                onPressed: (() {
                  setState(() {
                    _currentDate2 = DateTime.now();
                  });
                  }),
                ),  
              ],
          ),
          _buildBody(context),
        ],
      ),
    );
  }
}