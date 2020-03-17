import 'package:ejemplo_construccion/pages/calls.dart';
import 'package:ejemplo_construccion/pages/chats.dart';
import 'package:flutter/material.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
      /*
      bottomNavigationBar: BottomNavigationBar(
        onTap: _changePage,
        currentIndex: _currentPage,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.fast_rewind), title: Text('Retroceder')),
          BottomNavigationBarItem(
              icon: Icon(Icons.extension), title: Text('Funcionalidades')),
          BottomNavigationBarItem( 
              icon: Icon(Icons.face), title: Text('Usuarios')),
        ],
      ),*/
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[CallPage(), ChatPage()],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.camera, color: Colors.white),
       
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
