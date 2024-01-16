import 'package:flutter/material.dart';
import '../constants.dart';
import '../event_info_card.dart';
import '../models/test_models.dart';

class EventsInCategoriesListScreen extends StatefulWidget {
  final EventType eventCategory;

  const EventsInCategoriesListScreen({super.key, required this.eventCategory});

  @override
  State<EventsInCategoriesListScreen> createState() =>
      _EventsInCategoriesListScreenState();
}

class _EventsInCategoriesListScreenState
    extends State<EventsInCategoriesListScreen> {
  _EventsInCategoriesListScreenState();

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
                      widget.eventCategory.title.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  gapH16,
                  ListView.builder(
                    itemCount: events.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return EventInfoCard(event: events[index]);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
