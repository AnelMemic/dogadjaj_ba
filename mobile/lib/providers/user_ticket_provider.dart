


import '../models/event.dart';
import 'base_provider.dart';

class UserTicketProvider extends BaseProvider<Event> {
  UserTicketProvider() : super("Eventi");





  @override
  Event fromJson(data) {
    return Event.fromJson(data);
  }
}
