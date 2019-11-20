import 'package:flutter/material.dart';
import 'secondPage.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          leading: FlatButton(
              child: Icon(Icons.arrow_forward),
              onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SecondPage();
              })),
            ),
          actions: <Widget>[
            FlatButton(
              child: Text("下一页"),
              onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SecondPage();
              })),
            ),
          ],
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
      ),
    );
  }
}
