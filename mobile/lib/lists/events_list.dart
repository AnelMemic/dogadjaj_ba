import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/helpers/app_decoration.dart';


import 'package:mobile/helpers/error_dialog.dart';
import 'package:mobile/lists/event_categories_list.dart';
import 'package:mobile/lists/event_details_screen.dart';
import 'package:mobile/models/SearchObjects/event_search_object.dart';
import 'package:mobile/models/event.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/providers/event_provider.dart';
import 'package:mobile/providers/user_provider.dart';
import 'package:mobile/route/rutes.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

List<Event> dodaniEventi = [];

enum TypeEvent {
  Konferencija,
  Kongres,
  Seminar,
  Workshop,
  Sastanci,
  Sajmovi,
}

enum SubtypeOfEventType {
  Gradjevinarstvo,
  IT,
}

class EventsList extends StatefulWidget {
  const EventsList({Key? key}) : super(key: key);

  @override
  _EventsListState createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {
  int selectedCategory = 0;
  int selectedSubcategory = 0;
  late EventProvider _eventProvider;
  late UserProvider _userProvider;
  List<Event> _events = <Event>[];
  List<Event> _recommendedEvents = <Event>[];
  User? user;

  @override
  void initState() {
    super.initState();
    _eventProvider = context.read<EventProvider>();
    _userProvider = context.read<UserProvider>();
    loadUser();
    loadEvents();
    loadRecommendedEvents();
  }


void loadUser() async {
    var id = _userProvider.getUserId();
    print(id);
    try {
      var usersResponse = await _userProvider.getUserById(id!);
      setState(() {
        user = usersResponse;
      });
    } on Exception catch (e) {
      showErrorDialog(context, e.toString().substring(11));
    }
  }
//TODO
  List<Event> generateEvents() {
    List<Event> events = [];
    for (int i = 1; i <= 5; i++) {
      int eventId = i;
      int lokacijaId = i;
      int eventTypeId = i;
      String eventName = 'Event Name $i';
      DateTime eventDate = DateTime(DateTime.july);
      String stateMachine = 'State Machine $i';
      String eventImage = 'Image URL $i';
      String opis = 'Description $i';

      Event event = Event(
        eventId: eventId,
        lokacijaId: lokacijaId,
        eventTypeId: eventTypeId,
        eventName: eventName,
        eventDate: eventDate,
        stateMachine: stateMachine,
        eventImage: eventImage,
        opis: opis,
      );

      events.add(event);
    }
    return events;
  }

  void loadEvents() async {
    try {
      EventSearchObject searchObject = EventSearchObject(
          kategorija: selectedCategory, PodKategorija: selectedSubcategory);

      var Response = await _eventProvider.getPaged();

      setState(() {
        _events = Response;
      });
    } on Exception catch (e) {
      showErrorDialog(context, e.toString().substring(11));
    }
  }

  void loadRecommendedEvents() async {
    try {
    var id = _userProvider.getUserId();
      
      var Response = await _eventProvider.getRecommendedEvents(id!);

      setState(() {
        _recommendedEvents = Response;
      });
    } on Exception catch (e) {
      showErrorDialog(context, e.toString().substring(11));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Image.asset(
                    'assets/images/logo.png',
                    scale: 3.5,
                  ),
                ),
                Center(
                  child: Text(
                    'Događaji'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     children: [
                //       DropdownButton<int>(
                //         dropdownColor: kBackgroundColor,
                //         value: selectedCategory,
                //         onChanged: (int? newValue) {
                //           setState(() {
                //             selectedCategory = newValue!;
                //           });
                //           loadEvents();
                //         },
                //         items: [
                //           const DropdownMenuItem<int>(
                //             value: 0,
                //             child: Text(
                //               'Svi',
                //               style: TextStyle(
                //                 fontSize: 18,
                //                 fontWeight: FontWeight.bold,
                //                 color: Colors.white,
                //               ),
                //             ),
                //           ),
                //           for (var category in TypeEvent.values)
                //             DropdownMenuItem<int>(
                //               value: category.index + 1,
                //               child: Text(
                //                 category.toString().split('.')[1],
                //                 style: const TextStyle(
                //                   fontSize: 18,
                //                   fontWeight: FontWeight.bold,
                //                   color: Colors.white,
                //                 ),
                //               ),
                //             ),
                //         ],
                //       ),
                //       const SizedBox(width: 16),
                //       DropdownButton<int>(
                //         dropdownColor: kBackgroundColor,
                //         value: selectedSubcategory,
                //         onChanged: (int? newValue) {
                //           setState(() {
                //             selectedSubcategory = newValue!;
                //           });
                //           loadEvents();
                //         },
                //         items: [
                //           const DropdownMenuItem<int>(
                //             value: 0,
                //             child: Text(
                //               'Svi',
                //               style: TextStyle(
                //                 fontSize: 18,
                //                 fontWeight: FontWeight.bold,
                //                 color: Colors.white,
                //               ),
                //             ),
                //           ),
                //           for (var subcategory in SubtypeOfEventType.values)
                //             DropdownMenuItem<int>(
                //               value: subcategory.index + 1,
                //               child: Text(
                //                 subcategory.toString().split('.')[1],
                //                 style: const TextStyle(
                //                   fontSize: 18,
                //                   fontWeight: FontWeight.bold,
                //                   color: Colors.white,
                //                 ),
                //               ),
                //             ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                InkWell(
                  onTap: () {
                    // Logika za prikaz događaja na temelju odabrane kategorije i podkategorije
                    print('Odabrana kategorija: $selectedCategory');
                    print('Odabrana podkategorija: $selectedSubcategory');
                    // Dodajte ovdje logiku za prikaz događaja
                  },
                  child: Container(
                    color: kBackgroundColor,
                    child: Center(
                      child: _events.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemCount: _events.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EventDetailsScreen(
                                                event: _events[index]),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    color: _generateRandomColor(),
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Row(
                                      children: [
                                        // Image container
                                        Container(
                                          padding: const EdgeInsets.all(8),
                                          child: Image.asset(
                                            "assets/images/logo.png", // Replace with the actual property name
                                            height: 80,
                                            width: 80,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        // Event details container
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                _events[index].eventName!,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(height: 4),
                                              Text(
                                                _events[index].opis!,
                                                softWrap: true,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(height: 4),
                                              Text(
                                                _events[index].eventDate != null
                                                    ? DateFormat('dd/MM/yyyy')
                                                        .format(_events[index]
                                                            .eventDate!)
                                                    : "--",
                                                style: TextStyle(color: white),
                                              ),
                                              SizedBox(height: 4),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                          : const Text(
                              'Nema dostupnih događaja',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                _buildRecommendedTrainersWithInfo(context,)

              ],
            ),
          ],
        ),
      ),
    );
  }


Widget _buildRecommendedTrainersWithInfo(BuildContext context) {
  if (_recommendedEvents.isEmpty) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: AppDecoration.fillBlack.copyWith(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        'Nema preporučenih eventa',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  return Column(
    children: [
      Text('Preporučeni eventi' ,style: TextStyle(color: white, fontSize: 20),),
      SizedBox(height: 10, ),
      Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: AppDecoration.fillBlack.copyWith(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  itemCount: _recommendedEvents.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                EventDetailsScreen(
                                                    event: _recommendedEvents[index]),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        color: _generateRandomColor(),
                                        margin:
                                            const EdgeInsets.symmetric(vertical: 8),
                                        child: Row(
                                          children: [
                                            // Image container
                                            Container(
                                              padding: const EdgeInsets.all(8),
                                              child: Image.asset(
                                                "assets/images/logo.png", // Replace with the actual property name
                                                height: 80,
                                                width: 80,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            // Event details container
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    _recommendedEvents[index].eventName!,
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    _recommendedEvents[index].opis!,
                                                    softWrap: true,
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    _events[index].eventDate != null
                                                        ? DateFormat('dd/MM/yyyy')
                                                            .format(_events[index]
                                                                .eventDate!)
                                                        : "--",
                                                    style: TextStyle(color: white),
                                                  ),
                                                  SizedBox(height: 4),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                )
      ),
    ],
  );
}
  Color _generateRandomColor() {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }
}
