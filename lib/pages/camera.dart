import 'package:flutter/material.dart';



class CameraPage extends StatefulWidget {
  static const String routeName = '/camera';

  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {
  //final _cameraBloc = CameraBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera'),
      ),
      body: new ListView( children: [ new Image.asset('flutter/assets/images/foto.pgn', width: 100.0, height: 40.0, fit: BoxFit.cover, ),],),
     
    );
  }
}
