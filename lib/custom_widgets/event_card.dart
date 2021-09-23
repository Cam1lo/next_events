import 'package:flutter/material.dart';
import 'package:next_events/custom_widgets/timer_card.dart';
import 'package:next_events/data/EventData.dart';
import 'package:provider/provider.dart';

class EventCard extends StatefulWidget {
  final int index;

  const EventCard({Key? key, required this.index})
      : super(key: key);

  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard>
    with SingleTickerProviderStateMixin {
  bool faded = false;
  late AnimationController animationController;
  late Animation<Offset> animation;
  late EventsData data;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    animation = Tween<Offset>(begin: Offset.zero, end: Offset(2, 0)).animate(
        CurvedAnimation(curve: Curves.easeIn, parent: animationController));

    super.initState();
  }

  void fade() {
    animationController.forward().whenComplete(() {
      data.addEventDone(data.eventsData[widget.index]);
      data.removeEventByIndex(widget.index);
      animationController.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    data = Provider.of<EventsData>(context);

    return SlideTransition(
      position: animation,
      child: Row(
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
              color: data.eventsData[widget.index].color,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 200),
            child: Text(
              data.eventsData[widget.index].name,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Spacer(),
          TimerCard(
              date: data.eventsData[widget.index].date, function: fade),
          SizedBox(
            width: 37,
          )
        ],
      ),
    );
  }
}
