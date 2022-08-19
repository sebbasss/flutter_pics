// import flutter helper lirbrary
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

// create a class that will be our custom widget
// this class must extend the 'StatelessWidget' base class

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  // Must define a 'build' method that returns the widgets
  // that this widget will show
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;

    final response =
        await get('https://jsonplaceholder.typicode.com/photos/$counter');

    final imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      images.add(imageModel);
    });
  }

  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lets see some images!'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,
        ),
        body: ImageList(images),
      ),
    );
  }
}
