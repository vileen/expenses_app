import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expanses app'),
        ),
        body: Column( // takes the width of the child
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // because the other Card takes all the space available, Column also expands and therefore second card can take that space as well
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // container so that width control would be possible
            Container(
              width: double.infinity,
              child: Card(
                child: Text('CHART!'),
                color: Colors.blue,
                elevation: 5,
              ),
            ),
            Card(
              child: Text('LIST OF TX'),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
