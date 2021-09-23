import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:next_events/custom_widgets/add_event.dart';
import 'package:next_events/pages/config.dart';
import 'package:next_events/pages/done.dart';
import 'package:next_events/pages/events.dart';
import 'package:provider/provider.dart';

import 'data/EventData.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => EventsData(),
      child: MaterialApp(home: Main())));
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _pageIndex = 1;
  late Widget _showedPage = Events();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 300),
        animationCurve: Curves.easeInOut,
        backgroundColor: Color(0xff262626),
        color: Color(0xfffa7970),
        height: 55,
        index: 1,
        items: <Widget>[
          Icon(Icons.settings, size: 40),
          Icon(Icons.add_outlined, size: 40),
          Icon(Icons.check, size: 40),
        ],
        onTap: (index) {
          if (_pageIndex == index && index == 1) {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25)),
                ),
                backgroundColor: Color(0xff262626),
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return AddEvent();
                }).whenComplete(() {
              setState(() {
                _pageIndex = 1;
                _showedPage = pageSwitch(_pageIndex);
              });
            });
          } else {
            setState(() {
              _pageIndex = index;
              _showedPage = pageSwitch(_pageIndex);
            });
          }
        },
      ),
      body: Container(
        color: Color(0xff262626),
        child: _showedPage,
      ),
    );
  }

  Widget pageSwitch(int index) {
    switch (index) {
      case 0:
        return Config();
      case 1:
        return Events();
      case 2:
        return Done();
      default:
        return Container(
          child: Center(
            child: Text('ERROR 404'),
          ),
        );
    }
  }
}
