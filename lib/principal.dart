import 'package:ejemplo_construccion/pages/chats.dart';
import 'package:flutter/material.dart';
import 'package:ejemplo_construccion/dummies/chats.dart';






class PrincipalPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          primaryColor: Colors.blueGrey[900],
          primaryColorDark: Colors.blueGrey[900],
          accentColor: Colors.blueGrey[900]),
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
        children: <Widget>[Scaffold(
          body: Text("First Page")
        ), ListView.builder(
          itemCount: dataDummy.length, itemBuilder: (context, i) => new Column(
          children: <Widget>[
            new Divider(
              height: 10,
            ),
            new ListTile(
              leading: new CircleAvatar(
                //backgroundImage: new NetworkImage(dataDummy[i].avatar),
              ),
              title: new Text(dataDummy[i].title),
              subtitle: new Text(dataDummy[i].message),
              
            )
          ],
        ))],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => Scaffold(
                  body: Text("Camera")
                )
              )
            );
          },
        tooltip: 'Increment',
        child: Icon(Icons.camera, color: Colors.white),
       
      ), 
    );
  }
}