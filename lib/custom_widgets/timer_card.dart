import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../shared/date_utilites.dart';

class TimerCard extends StatefulWidget {
  final DateTime date;
  final Function function;

  const TimerCard({Key? key, required this.date, required this.function})
      : super(key: key);

  @override
  _TimerCardState createState() => _TimerCardState();
}

class _TimerCardState extends State<TimerCard> {
  final df = new DateFormat('dd/MM/yyyy');
  late var timeRemaining;

  @override
  void initState() {
    timeRemaining = DateUtilities.formatTimeRemaining(widget.date);

    Timer.periodic(Duration(minutes: 1), (timer) {
      print(timeRemaining == '');
      if (timeRemaining == '') {
        timer.cancel();
      } else {
        if (mounted)
          setState(() {
            timeRemaining = DateUtilities.formatTimeRemaining(widget.date);
          });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (timeRemaining != '') {
      return Column(
        children: [
          Text(
            timeRemaining,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            df.format(widget.date),
            style: TextStyle(fontSize: 13, color: Color(0xffBBBBBB)),
          ),
        ],
      );
    } else {
      return InkWell(
        onTap: () {
          widget.function();
        },
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: Color(0xfffa7970),
              ),
              child: Icon(
                Icons.done,
                size: 30,
              ),
            ),
            Text(
              df.format(widget.date),
              style: TextStyle(fontSize: 13, color: Color(0xffBBBBBB)),
            )
          ],
        ),
      );
    }
  }
}
