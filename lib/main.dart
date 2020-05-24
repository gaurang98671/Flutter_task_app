import 'package:flutter/material.dart';
import 'add_tasks.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Task app',

      home: MyHomePage(title: 'Task app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Center(child: Text(widget.title,)),
      ),
      body: Container(
        color: Colors.black54,
        child: Center(

          child: Column(
            children: <Widget>[
              Text(
                'Your tasks'
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purpleAccent[100],
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>add_tasks()));
        },
        tooltip: 'Add task',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
