import 'package:flutter/material.dart';
import 'package:next_events/custom_widgets/done_event_card.dart';
import 'package:next_events/data/EventData.dart';
import 'package:provider/provider.dart';

class Done extends StatefulWidget {
  const Done({Key? key}) : super(key: key);

  @override
  _DoneState createState() => _DoneState();
}

class _DoneState extends State<Done> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<EventsData>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 50, 0, 30),
          child: Text(
            'Events',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        Container(
          child: (data.doneEvents.length > 0)
              ? ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: data.doneEvents.length,
                  itemBuilder: (context, index) {
                    return new DoneEventCard(index: index);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 28,
                    );
                  },
                )
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: Text(
                      'No events done yet',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
