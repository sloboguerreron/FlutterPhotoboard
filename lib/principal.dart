import 'package:flutter/material.dart';
import 'package:ejemplo_construccion/dummies/chats.dart';

import 'package:ejemplo_construccion/rounded_picker.dart';



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
  
  const MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {


  DateTime dateTime;
  Duration duration;
  

  TabController _tabController;
  @override
  void initState() {
    dateTime = DateTime.now();
    duration = Duration(minutes: 10);
    super.initState();
    _tabController = TabController(vsync: this, length: 2, initialIndex: 0);
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
            Tab(
              text: 'Materias',
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(height: 50),
              Expanded(
                  child: ListView(
                      padding: const EdgeInsets.only(bottom: 50),
                      children: <Widget>[
                    Ink(
                      decoration: const ShapeDecoration(
                        color: Colors.blueGrey,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                      icon: Icon(Icons.calendar_today),
                      tooltip: "Ver Calendario",
                      color: Colors.white,
                      onPressed: () async {
                        DateTime newDateTime = await showRoundedDatePicker(
                            context: context, theme: ThemeData.dark());
                        if (newDateTime != null) {
                          setState(() => dateTime = newDateTime);
                        }
                      },
                    ),
                    ),
                  ])),
            ],
          ),
          ListView.builder(
              itemCount: dataDummy.length,
              itemBuilder: (context, i) => new Column(
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
                  ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
                builder: (BuildContext context) =>
                Text("Camera Page")
                 /*TakePictureScreen(
                  camera: widget.camera
                )*/
              )
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.camera, color: Colors.white),
      ),
    );
  }
}



