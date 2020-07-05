import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';



class add_tasks extends StatefulWidget {
  @override
  _add_tasksState createState() => _add_tasksState();
}

class _add_tasksState extends State<add_tasks> {

  int initial_hour=1;
  int initial_min=1;
  String radio_button_value='AM';
  bool checkBoxValue=false;
  AssetImage img=AssetImage('images/day.PNG');
  DateTime date_time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Add tasks'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: ()
        {
          Navigator.pop(context);
        },
        child: Icon(Icons.check),
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: img
          )
        ),

        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),

            Container(
              width: 350,
              child: TextField(
                decoration: InputDecoration(

                  filled: true,
                  hintText: 'Title',
                    border: new OutlineInputBorder(

                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(
                      ),
                    ),

                  fillColor: Colors.white,
                ),
                cursorColor: Colors.white,

              ),
            ),
           SizedBox(height: 40,),

           Row(
             children: <Widget>[
               SizedBox(width: 65,),
               Column(
                 children: <Widget>[

                   Theme(
                     data: ThemeData(
                       accentColor: Colors.greenAccent
                     ),
                     child: NumberPicker.integer(initialValue: initial_hour, minValue: 1, maxValue: 12, onChanged: (val){
                       setState(() {
                         initial_hour=val;
                       }
                       );
                     }
                     ),
                   ),

                   Text('Hour',
                   style: TextStyle(
                   color: Colors.white
                   ),
                   )
                 ],
               ),

               Column(
                 children: <Widget>[

                   Theme(
                     data: ThemeData(
                       accentColor: Colors.greenAccent
                     ),
                     child: NumberPicker.integer(

                         initialValue: initial_min,
                         minValue: 00,
                         maxValue: 59,
                         onChanged: (val){
                        setState(() {
                         initial_min=val;
                       },
                       );
                     },
                     ),
                   ),

                   Text('Minutes',
                   style: TextStyle(
                   color: Colors.white
                   ),
                   )
                 ],
               ),
             ],
           ),
            Row(
              children: <Widget>[
                SizedBox(width: 30,
                ),
                RaisedButton(
                    color: Colors.greenAccent,
                    child: Text('Set date'),
                    onPressed:(){
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(2019, 1, 5),
                          maxTime: DateTime(2022, 12, 31), onChanged: (date) {
                            print('change $date');
                          }, onConfirm: (date) {
                            date_time=date;
                          }, currentTime: DateTime.now(), locale: LocaleType.en
                      );
                    }),
              ],
            ),
            RadioListTile(
              activeColor: Colors.greenAccent,
              groupValue: radio_button_value,
              title: Text('AM',
              style: TextStyle(
                color: Colors.white
              ),
              ),
              value: "AM",
              onChanged: (val){setState(() {
                radio_button_value=val;
                img=AssetImage('images/day.PNG');
              }
              );
              },
            ),

            RadioListTile(
              activeColor: Colors.greenAccent,
              groupValue: radio_button_value,
              title: Text('PM',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              value: 'PM',
              onChanged: (val){
                setState(()
                {
                radio_button_value=val;
                img=AssetImage('images/night.PNG');
                }
              );
              },
            ),


            Container(
              child: Row(
                children: <Widget>[

                  SizedBox(
                    width: 11,
                  ),
                  Checkbox(
                    value: checkBoxValue,
                    activeColor: Colors.greenAccent,
                    onChanged: (bool val)
                    {
                      checkBoxValue=true;
                    },
                  ),
                  Text('Remind me?',
                  style: TextStyle(
                  color: Colors.white,
                    fontSize: 15
                  ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


