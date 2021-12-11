import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

class CarouselCalendar extends StatefulWidget {
  final EventList<Event> events;
  CarouselCalendar({this.events});
  _CarouselCalendarState createState() => _CarouselCalendarState();
}

class _CarouselCalendarState extends State<CarouselCalendar> {  

  EventList<Event> events;

  DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();
  String _currentMonth = DateFormat.yMMM().format(DateTime(2019, 2, 3));
  DateTime _targetDateTime = DateTime(2020, 10, 3);
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

  CalendarCarousel _calendarCarouselNoHeader;
  
  void initState() {

    events = widget.events;
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
    
    // 한달치 달력 설정 모음
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      // todayBorderColor: Colors.green,
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate2 = date);
        events.forEach((event) => print(event.title));
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
//      firstDayOfWeek: 4,
      markedDatesMap: _markedDateMap,
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
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
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
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
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
            child: _calendarCarouselNoHeader,
          ), 
        ],
      ),
    );
  }
}