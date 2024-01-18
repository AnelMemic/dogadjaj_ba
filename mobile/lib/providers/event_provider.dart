
import 'package:dogadjaj_ba/models/event.dart';

import 'base_provider.dart';

class EventProvider extends BaseProvider<Event> {
  EventProvider() : super("Eventi");





  @override
  Event fromJson(data) {
    return Event.fromJson(data);
  }
}
