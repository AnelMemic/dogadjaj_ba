import 'package:flutter/material.dart';
import 'package:mobile/lists/events_list.dart';
import 'package:mobile/models/event.dart';
 
class EventDetailsScreen extends StatelessWidget {
  final Event event;
  const EventDetailsScreen({super.key, required this.event});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: GestureDetector(
        onTap: () {
          if (!dodaniEventi.contains(event)) {
            dodaniEventi.add(event);
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
                        child:
                            Image.asset("assets/images/logo.png", height: 100),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            event.eventName ?? '',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  Icon(Icons.location_on, color: Colors.white),
                                  SizedBox(width: 8),
                                  Text("lokacija",
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.calendar_today,
                                      color: Colors.white),
                                  const SizedBox(width: 8),
                                  Text(event.eventDate.toString(),
                                      style:
                                          const TextStyle(color: Colors.white)),
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
                event.opis ?? "",
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                event.stateMachine ?? '',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}