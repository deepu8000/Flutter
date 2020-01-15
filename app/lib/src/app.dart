import 'package:app/src/models/configs/appconfig.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  createState() => _AppState();
}

class _AppState extends State<App> {

  AppConfig appConfig = new AppConfig();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
