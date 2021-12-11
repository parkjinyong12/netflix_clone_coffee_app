import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat;

class CouponUseList extends StatelessWidget {

  final EventList<Event> events;
  final DateTime selected_date;
  CouponUseList({this.events,this.selected_date});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Container(
          //   padding: EdgeInsets.all(25),
          // ),          
          Column(
            children: getEventlist(events, selected_date)
          )
        ],        
      )
    );
  }  
} 

List<Widget> getEventlist(EventList<Event> events, DateTime selected_date) {
  List<Widget> results = [];
  print('selected_date: ' + selected_date.toString());
  events.getEvents(selected_date).forEach((event) {       
    results.add(Container(
      padding: EdgeInsets.all(2),
      child: Column(children: <Widget>[
        Text(DateFormat('HH:mm:ss').format(event.getDate()) + ' ' + event.getTitle()),
        ],)
      ));
  });
  if(results.length == 0) {
    results.add(Container(
      padding: EdgeInsets.all(2),
      child: Text('없음'),
      ));
  }
  return results;
}