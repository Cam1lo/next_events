import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:next_events/data/EventData.dart';
import 'package:next_events/models/Event.dart';
import 'package:next_events/shared/colors_map.dart';
import 'package:provider/provider.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({Key? key}) : super(key: key);

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final df = new DateFormat('dd/MM/yyyy hh:mm aa');
  final _formKey = GlobalKey<FormState>();
  String _eventType = 'other';
  DateTime _date = DateTime.now();
  final _eventNameController = TextEditingController();
  bool _datePickerOpened = false;

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<EventsData>(context);

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.bounceInOut,
      decoration: BoxDecoration(
        color: Color(0xff262626),
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      height:
          (MediaQuery.of(context).viewInsets.bottom != 0 || _datePickerOpened)
              ? MediaQuery.of(context).size.height * 0.6
              : MediaQuery.of(context).size.height * 0.25,
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                controller: _eventNameController,
                style: TextStyle(color: Colors.white, fontSize: 18),
                autofocus: true,
                cursorColor: Color(0xfffa7970),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xfffa7970)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xfffa7970)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _eventType = 'social';
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                              color: Color(0xff262626),
                              border: Border.all(color: Colors.green),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: (_eventType == 'social')
                                  ? [
                                      BoxShadow(
                                        color: Colors.green.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 1,
                                        offset: Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ]
                                  : []),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Social',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.green),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _eventType = 'health';
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                              color: Color(0xff262626),
                              border: Border.all(color: Colors.red),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: (_eventType == 'health')
                                  ? [
                                      BoxShadow(
                                        color: Colors.red.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 1,
                                        offset: Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ]
                                  : []),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Health',
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _eventType = 'work';
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                              color: Color(0xff262626),
                              border: Border.all(color: Colors.orange),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: (_eventType == 'work')
                                  ? [
                                      BoxShadow(
                                        color: Colors.orange.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 1,
                                        offset: Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ]
                                  : []),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Work',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.orange),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _eventType = 'other';
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                              color: Color(0xff262626),
                              border: Border.all(color: Colors.blue),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: (_eventType == 'other')
                                  ? [
                                      BoxShadow(
                                        color: Colors.blue.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 1,
                                        offset: Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ]
                                  : []),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Other',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                  InkWell(
                    onTap: () {
                      Event newEvent = Event(
                          name: _eventNameController.text,
                          date: _date,
                          color: colorsMap[_eventType] ??
                              Colors.black as MaterialColor);

                      data.addEvent(newEvent);
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xfffa7970),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Icon(
                        Icons.add,
                        size: 30,
                        color: Color(0xff262626),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
              SizedBox(height: 7),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    _datePickerOpened = true;
                  });
                  DatePicker.showDateTimePicker(context,
                      showTitleActions: true,
                      minTime: DateTime.now(),
                      maxTime: DateTime(2025, 12, 31), onConfirm: (date) {
                    setState(() {
                      _date = date;
                      _datePickerOpened = false;
                    });
                  }, onCancel: () {
                    setState(() {
                      _datePickerOpened = false;
                    });
                  }, currentTime: DateTime.now(), locale: LocaleType.es);
                },
                child: Text(df.format(_date),
                    style: TextStyle(color: Colors.white54, fontSize: 18)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
