import 'package:flutter/cupertino.dart';
import 'package:next_events/models/Event.dart';

class EventsData extends ChangeNotifier {
  List<Event> eventsData = [];
  List<Event> doneEvents = [];

  addEventDone(Event value) {
    this.doneEvents.add(value);
    notifyListeners();
  }

  removeEventDoneByIndex(int index) {
    this.doneEvents.removeAt(index);
    notifyListeners();
  }

  addEvent(Event value) {
    this.eventsData.add(value);
  }

  removeEventByValue(Event value) {
    this.eventsData.remove(value);
    notifyListeners();
  }

  removeEventByIndex(int value) {
    this.eventsData.removeAt(value);
    notifyListeners();
  }
}

