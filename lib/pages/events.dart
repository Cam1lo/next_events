import 'package:flutter/material.dart';
import 'package:next_events/custom_widgets/event_card.dart';
import 'package:next_events/data/EventData.dart';
import 'package:provider/provider.dart';

class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
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
          child: (data.eventsData.length > 0)
              ? ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: data.eventsData.length,
                  itemBuilder: (context, index) {
                    return new EventCard(index: index);
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
                      'No events created yet',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
