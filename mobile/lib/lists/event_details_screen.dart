
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/lists/events_list.dart';
import 'package:mobile/models/event.dart';
import 'package:mobile/providers/location_provider.dart';
import 'package:provider/provider.dart';

class EventDetailsScreen extends StatefulWidget {
  final Event event;
  const EventDetailsScreen({super.key, required this.event});

  @override
  _EventDetailsScreenState createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  late LocationProvider _locationProvider;
  Map<int, String> locationMap = {}; // Mapa lokacija: lokacijaId -> naziv objekta

  @override
  void initState() {
    super.initState();
    _locationProvider = context.read<LocationProvider>();
    fetchLocations();
  }

  // 🔹 Dohvaća lokacije sa backenda i sprema ih u mapu
  void fetchLocations() async {
    try {
      var locations = await _locationProvider.getLocations();
      setState(() {
        locationMap = {for (var loc in locations) loc.lokacijaId: "${loc.nazivObjekta}, ${loc.adresa}"};
      });
    } catch (e) {
      print("Greška pri učitavanju lokacija: $e");
    }
  }

  // 🔹 Vraća naziv lokacije na osnovu `lokacijaId`
  String getLokacija(int? lokacijaId) {
    if (lokacijaId == null) return "Nepoznata lokacija";
    return locationMap[lokacijaId] ?? "Nepoznata lokacija";
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: GestureDetector(
        onTap: () {
          if (!dodaniEventi.contains(widget.event)) {
            dodaniEventi.add(widget.event);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Karta uspješno dodana u korpu.")),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Event je već dodan u korpu.")),
            );
          }
        },
        child: Container(
          width: double.infinity,
          height: 80,
          color: Colors.red,
          alignment: Alignment.center,
          child: const Text(
            'KUPI ULAZNICU',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset("assets/images/logo.png", height: 100),
            ),
            Container(
              color: const Color.fromARGB(255, 102, 101, 101),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset("assets/images/logo.png", height: 100),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.event.eventName ?? '',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.location_on, color: Colors.white),
                                  const SizedBox(width: 8),
                                  Text(
                                    getLokacija(widget.event.lokacijaId),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.calendar_today, color: Colors.white),
                                  const SizedBox(width: 8),
                                  Text(
                                    widget.event.eventDate != null
                                        ? DateFormat('dd.MM.yyyy HH:mm').format(widget.event.eventDate!)
                                        : "--",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.event.opis ?? "",
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.event.stateMachine ?? '',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

