import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:next_events/data/EventData.dart';
import 'package:provider/provider.dart';

class DoneEventCard extends StatefulWidget {
  final int index;

  const DoneEventCard({Key? key, required this.index}) : super(key: key);

  @override
  _DoneEventCardState createState() => _DoneEventCardState();
}

class _DoneEventCardState extends State<DoneEventCard> {
  final df = new DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<EventsData>(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 24,
        ),
        new Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: data.doneEvents[widget.index].color,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 200),
          child: Text(
            data.doneEvents[widget.index].name,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        Spacer(),
        Text(
          df.format(data.doneEvents[widget.index].date),
          style: TextStyle(fontSize: 13, color: Color(0xffBBBBBB)),
        ),
        SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            data.removeEventDoneByIndex(widget.index);
          },
          child: Icon(
            Icons.delete,
            size: 30,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 37,
        )
      ],
    );
  }
}
