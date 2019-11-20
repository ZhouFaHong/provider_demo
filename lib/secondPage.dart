import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text("SecondPage"),
      ),
      body: Center(
        child: Text("${Provider.of<Counter>(context).count}"), //1
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<Counter>(context).add(); //2
        },
        child: Icon(Icons.add),
      ),
    ));
  }
}
