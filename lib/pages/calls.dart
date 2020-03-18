import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:table_calendar/table_calendar.dart';

class CallPage extends StatefulWidget{
  @override
  CallState createState() {
    return CallState();
  }
  

}

class CallState extends State<CallPage>{
  final LocalStorage storage = new LocalStorage('clh');
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      body: Text("Bienvenido "+storage.getItem("name")),
    );
  }
  

}
