import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget{
  @override
  CalendarState createState() {
    // TODO: implement createState
    return CalendarState();
  }
  

}

class CalendarState extends State<CalendarPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: new ListView( children: [ new Image.asset( 'flutter/assets/images/foto2.pgn', width: 100.0, height: 40.0, fit: BoxFit.cover, ),],),
     
    );
    /* @override
      void initState() {
      super.initState();
       _calendarController = CalendarController();
}

@override
void dispose() {
  _calendarController.dispose();
  super.dispose();
}

@override
Widget build(BuildContext context) {
  return TableCalendar(
    calendarController: _calendarController,
  );
}
*/
  }
  

}
