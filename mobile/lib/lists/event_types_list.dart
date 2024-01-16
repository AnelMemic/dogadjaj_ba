import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/test_models.dart';

class EventTypesList extends StatelessWidget {
  final List<EventType> eventTypes;
  const EventTypesList({super.key, required this.eventTypes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: eventTypes.length,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return SizedBox(
          width: 125,
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    width: 125,
                    height: 100,
                    decoration: const BoxDecoration(color: Colors.black),
                    child: Icon(
                      eventTypes[index].icon,
                      size: 85,
                      color: Colors.grey,
                    )),
                gapH8,
                Text(
                  eventTypes[index].title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
