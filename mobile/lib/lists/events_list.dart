import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/helpers/error_dialog.dart';
import 'package:mobile/lists/event_categories_list.dart';
import 'package:mobile/models/SearchObjects/event_search_object.dart';
import 'package:mobile/models/event.dart';
import 'package:mobile/providers/event_provider.dart';
import 'package:mobile/route/rutes.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

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
  List<Event> _events = <Event>[];

  @override
  void initState() {
    super.initState();
    _eventProvider = context.read<EventProvider>();
    loadEvents();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: DropdownButton<int>(
                            dropdownColor: kBackgroundColor,
                            value: selectedCategory,
                            onChanged: (int? newValue) {
                              setState(() {
                                selectedCategory = newValue!;
                              });
                              loadEvents();
                            },
                            items: [
                              DropdownMenuItem<int>(
                                value: 0,
                                child: Text(
                                  'Svi',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              for (var category in TypeEvent.values)
                                DropdownMenuItem<int>(
                                  value: category.index + 1,
                                  child: Text(
                                    category.toString().split('.')[1],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: DropdownButton<int>(
                            dropdownColor: kBackgroundColor,
                            value: selectedSubcategory,
                            onChanged: (int? newValue) {
                              setState(() {
                                selectedSubcategory = newValue!;
                              });
                              loadEvents();
                            },
                            items: [
                              const DropdownMenuItem<int>(
                                value: 0,
                                child: Text(
                                  'Svi',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              for (var subcategory in SubtypeOfEventType.values)
                                DropdownMenuItem<int>(
                                  value: subcategory.index + 1,
                                  child: Text(
                                    subcategory.toString().split('.')[1],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Logika za prikaz događaja na temelju odabrane kategorije i podkategorije
                      print('Odabrana kategorija: $selectedCategory');
                      print('Odabrana podkategorija: $selectedSubcategory');
                      // Dodajte ovdje logiku za prikaz događaja
                    },
                    child: Container(
                      height: 500,
                      color:
                          kBackgroundColor, // Podesite boju na temelju odabrane kategorije
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: _events.isNotEmpty
                              ? ListView.builder(
                                  itemCount: _events.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      color: _generateRandomColor(),
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 8),
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
                                            child: Container(
                                              padding: const EdgeInsets.all(8),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    _events[index].eventName!,
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  SizedBox(height: 4),
                                                 Text(
                                                    _events[index].opis!,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    _events[index].eventDate !=
                                                            null
                                                        ? DateFormat(
                                                                'dd/MM/yyyy')
                                                            .format(
                                                                _events[index]
                                                                    .eventDate!)
                                                        : "--",
                                                  style: TextStyle(color: white),),
                                                  SizedBox(height: 4),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pushNamed(
                                                          context,
                                                          AppRoutes.payment);
                                                    },
                                                    child: Text('Kupi kartu'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                )
                              : Text(
                                  'Nema dostupnih događaja',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _generateRandomColor() {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }
}
