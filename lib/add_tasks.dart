import 'dart:async';
import 'dart:math';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter/material.dart';

class add_tasks extends StatefulWidget {
  @override
  _add_tasksState createState() => _add_tasksState();
}

class _add_tasksState extends State<add_tasks> {
  int initial_hour=1;
  int initial_min=1;
  String radio_button_value='AM';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add tasks'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Title'
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Description"
              ),
            ),

           Center(
             child: Row(
               children: <Widget>[
                 NumberPicker.integer(initialValue: initial_hour, minValue: 1, maxValue: 12, onChanged: (val){
                   setState(() {
                     initial_hour=val;
                   });
                 }),
                 NumberPicker.integer(initialValue: initial_min, minValue: 1, maxValue: 60, onChanged: (val){
                   setState(() {
                     initial_min=val;
                   });
                 }),
               ],
             ),

           ),
            RadioListTile(
              groupValue: radio_button_value,
              title: Text('AM'),
              value: "AM",
              onChanged: (val){setState(() {
                radio_button_value=val;
              });},

            ),
            RadioListTile(
              groupValue: radio_button_value,
              title: Text('PM'),
              value: 'PM',
              onChanged: (val){setState(() {
                radio_button_value=val;
              });},

            )
          ],
        ),
      ),
    );
  }
}
