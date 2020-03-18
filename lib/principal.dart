import 'package:ejemplo_construccion/pages/Calendar.dart';
import 'package:ejemplo_construccion/pages/camera.dart';
import 'package:flutter/material.dart';





class PrincipalPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.cyan[900],
          primaryColorDark: Colors.cyan[900],
          accentColor: Colors.cyan[900]),
      home: MyHomePage(title: 'PhotoBoard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  int _currentPage = 0;
  
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2,initialIndex: 0);
  }

 
  void _changePage(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0.5,
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _tabController,
          tabs: <Widget>[
          Tab(text: 'Calendario'),
          Tab(text: 'Materias',)
        ],),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[CameraPage(), CalendarPage()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => CameraPage()
              )
            );
          },
        tooltip: 'Increment',
        child: Icon(Icons.camera, color: Colors.white),
       
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
