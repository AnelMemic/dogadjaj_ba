// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:mobile/constants.dart';
// import 'package:mobile/helpers/app_decoration.dart';
// import 'package:mobile/helpers/error_dialog.dart';
// import 'package:mobile/lists/event_details_screen.dart';
// import 'package:mobile/models/SearchObjects/event_search_object.dart';
// import 'package:mobile/models/event.dart';
// import 'package:mobile/providers/event_provider.dart';
// import 'package:mobile/providers/user_provider.dart';
// import 'package:provider/provider.dart';

// List<Event> dodaniEventi = [];

// enum TypeEvent {
//   Konferencija,
//   Kongres,
//   Seminar,
//   Workshop,
//   Sastanci,
//   Sajmovi,
// }

// class EventsList extends StatefulWidget {
//   final TypeEvent? selectedTypeEvent; // Može biti null

//   const EventsList({Key? key, this.selectedTypeEvent}) : super(key: key);

//   @override
//   _EventsListState createState() => _EventsListState();
// }

// class _EventsListState extends State<EventsList> {
//   late EventProvider _eventProvider;
//   late UserProvider _userProvider;
//   List<Event> _events = <Event>[];
//   List<Event> _recommendedEvents = <Event>[];

//   @override
//   void initState() {
//     super.initState();
//     _eventProvider = context.read<EventProvider>();
//     _userProvider = context.read<UserProvider>();
//     loadEvents();
//     loadRecommendedEvents();
//   }

//   void loadEvents() async {
//     try {
//       EventSearchObject searchObject = EventSearchObject(
//         kategorija: widget.selectedTypeEvent!.index + 1, // Može biti null
//       );

//       var response = await _eventProvider.getPaged(searchObject: searchObject);

//       setState(() {
//         _events = response;
//       });
//     } on Exception catch (e) {
//       showErrorDialog(context, e.toString().substring(11));
//     }
//   }

// void loadRecommendedEvents() async {
//   try {
//     var response = await _eventProvider.getRecommendedEvents(); // Ispravno pozivanje metode

//     setState(() {
//       _recommendedEvents = response;
//     });
//   } on Exception catch (e) {
//     showErrorDialog(context, e.toString().substring(11));
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kBackgroundColor,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Logo
//             Padding(
//               padding: const EdgeInsets.all(35.0),
//               child: Image.asset(
//                 'assets/images/logo.png',
//                 scale: 3.5,
//               ),
//             ),
//             Center(
//               child: Text(
//                 'Događaji'.toUpperCase(),
//                 style: const TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),

//             // Dropdown za filtriranje po eventType
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: DropdownButton<TypeEvent>(
//                 dropdownColor: Colors.black,
//                 value: widget.selectedTypeEvent,
//                 items: TypeEvent.values.map((TypeEvent type) {
//                   return DropdownMenuItem<TypeEvent>(
//                     value: type,
//                     child: Text(
//                       type.toString().split('.').last,
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   );
//                 }).toList(),
//                 onChanged: (TypeEvent? newValue) {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => EventsList(selectedTypeEvent: newValue),
//                     ),
//                   );
//                 },
//                 hint: Text(
//                   "Odaberite tip događaja",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),

//             // Lista događaja
//             _events.isNotEmpty
//                 ? ListView.builder(
//                     shrinkWrap: true,
//                     padding: EdgeInsets.zero,
//                     itemCount: _events.length,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemBuilder: (context, index) {
//                       return GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => EventDetailsScreen(
//                                   event: _events[index]),
//                             ),
//                           );
//                         },
//                         child: Container(
//                           color: _generateRandomColor(),
//                           margin: const EdgeInsets.symmetric(vertical: 8),
//                           padding: const EdgeInsets.all(10),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 _events[index].eventName!,
//                                 style: const TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               SizedBox(height: 4),
//                               Text(
//                                 _events[index].opis ?? "",
//                                 softWrap: true,
//                                 overflow: TextOverflow.ellipsis,
//                                 maxLines: 1,
//                                 style: const TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               SizedBox(height: 4),
//                               Text(
//                                 _events[index].eventDate != null
//                                     ? DateFormat('dd/MM/yyyy')
//                                         .format(_events[index].eventDate!)
//                                     : "--",
//                                 style: TextStyle(color: white),
//                               ),
//                               SizedBox(height: 4),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   )
//                 : Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Text(
//                       'Nema dostupnih događaja',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),

//             SizedBox(height: 15),

//             // Preporučeni eventi
//             _buildRecommendedEvents(context),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildRecommendedEvents(BuildContext context) {
//     if (_recommendedEvents.isEmpty) {
//       return Container(
//         margin: EdgeInsets.all(10),
//         padding: EdgeInsets.all(10),
//         decoration: AppDecoration.fillBlack.copyWith(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Text(
//           'Nema preporučenih eventa',
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//       );
//     }

//     return Column(
//       children: [
//         Text('Preporučeni eventi', style: TextStyle(color: white, fontSize: 20)),
//         SizedBox(height: 10),
//         Container(
//           margin: EdgeInsets.all(10),
//           padding: EdgeInsets.all(10),
//           decoration: AppDecoration.fillBlack.copyWith(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: ListView.builder(
//             shrinkWrap: true,
//             padding: EdgeInsets.zero,
//             itemCount: _recommendedEvents.length,
//             physics: const NeverScrollableScrollPhysics(),
//             itemBuilder: (context, index) {
//               return GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) =>
//                           EventDetailsScreen(event: _recommendedEvents[index]),
//                     ),
//                   );
//                 },
//                 child: Container(
//                   color: _generateRandomColor(),
//                   margin: const EdgeInsets.symmetric(vertical: 8),
//                   padding: const EdgeInsets.all(10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         _recommendedEvents[index].eventName!,
//                         style: const TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         _recommendedEvents[index].opis!,
//                         softWrap: true,
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 1,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           color: Colors.white,
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   Color _generateRandomColor() {
//     return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
//   }
// }









import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/helpers/app_decoration.dart';
import 'package:mobile/helpers/error_dialog.dart';
import 'package:mobile/lists/event_details_screen.dart';
import 'package:mobile/models/SearchObjects/event_search_object.dart';
import 'package:mobile/models/event.dart';
import 'package:mobile/providers/event_provider.dart';
import 'package:mobile/providers/user_provider.dart';
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

class EventsList extends StatefulWidget {
  final TypeEvent? selectedTypeEvent;

  const EventsList({Key? key, this.selectedTypeEvent}) : super(key: key);

  @override
  _EventsListState createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {
  late EventProvider _eventProvider;
  late UserProvider _userProvider;
  List<Event> _events = <Event>[];
  List<Event> _recommendedEvents = <Event>[];

  @override
  void initState() {
    super.initState();
    _eventProvider = context.read<EventProvider>();
    _userProvider = context.read<UserProvider>();
    loadEvents();
    loadRecommendedEvents();
  }

  void loadEvents() async {
    try {
      EventSearchObject searchObject = EventSearchObject(
        kategorija: widget.selectedTypeEvent?.index ?? 1,
      );

      var response = await _eventProvider.getPaged(searchObject: searchObject);

      setState(() {
        _events = response;
      });
    } on Exception catch (e) {
      showErrorDialog(context, e.toString().substring(11));
    }
  }

  void loadRecommendedEvents() async {
    try {
      var response = await _eventProvider.getRecommendedEvents();

      if (response != null) {
        setState(() {
          _recommendedEvents = response;
        });
      } else {
        print("⚠️ API nije vratio preporučene evente!");
      }
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
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButton<TypeEvent>(
                dropdownColor: Colors.black,
                value: widget.selectedTypeEvent,
                items: TypeEvent.values.map((TypeEvent type) {
                  return DropdownMenuItem<TypeEvent>(
                    value: type,
                    child: Text(
                      type.toString().split('.').last,
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
                onChanged: (TypeEvent? newValue) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EventsList(selectedTypeEvent: newValue),
                    ),
                  );
                },
                hint: Text(
                  "Odaberite tip događaja",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            _events.isNotEmpty
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
                              builder: (context) => EventDetailsScreen(
                                  event: _events[index]),
                            ),
                          );
                        },
                        child: Container(
                          color: _generateRandomColor(),
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                _events[index].opis ?? "",
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
                                        .format(_events[index].eventDate!)
                                    : "--",
                                style: TextStyle(color: white),
                              ),
                              SizedBox(height: 4),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Nema dostupnih događaja',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

            SizedBox(height: 15),
            _buildRecommendedEvents(context),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendedEvents(BuildContext context) {
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
        Text('Preporučeni eventi', style: TextStyle(color: white, fontSize: 20)),
        SizedBox(height: 10),
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
              if (index >= _recommendedEvents.length) return SizedBox();

              final event = _recommendedEvents[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          EventDetailsScreen(event: event),
                    ),
                  );
                },
                child: Container(
                  color: _generateRandomColor(),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.eventName ?? 'Nepoznat događaj',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        event.opis ?? "Nema opisa",
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Color _generateRandomColor() {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }
}



















