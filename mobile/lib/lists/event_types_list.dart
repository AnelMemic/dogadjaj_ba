// import 'package:flutter/material.dart';
// import '../constants.dart';
// import '../models/test_models.dart';

// class EventTypesList extends StatelessWidget {
//   final List<EventType> eventTypes;
  
//   const EventTypesList({super.key, required this.eventTypes});
  
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: eventTypes.length < 3 ? eventTypes.length : 3,
//       padding: EdgeInsets.zero,
//       shrinkWrap: true,
//       scrollDirection: Axis.horizontal,
//       itemBuilder: (context, index) {
//         return SizedBox(
//           width: 125,
//           child: Padding(
//             padding: const EdgeInsets.only(right: 10),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Container(
//                     width: 125,
//                     height: 100,
//                     decoration: const BoxDecoration(color: Colors.black),
//                     child: Icon(
//                       eventTypes[index].icon,
//                       size: 85,
//                       color: Colors.grey,
//                     )),
//                 gapH8,
//                 Text(
//                   eventTypes[index].title,
//                   style: const TextStyle(
//                       fontWeight: FontWeight.bold, color: Colors.white),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/test_models.dart';

class EventTypesList extends StatelessWidget {
  final List<EventType> eventTypes;
  final Function(EventType) onEventTypeSelected; // 🟢 Dodano za navigaciju

  const EventTypesList({
    super.key, 
    required this.eventTypes,
    required this.onEventTypeSelected, // 🟢 Dodano kao obavezan parametar
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: eventTypes.length < 3 ? eventTypes.length : 3,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            onEventTypeSelected(eventTypes[index]); // 🟢 Klik za navigaciju
          },
          child: SizedBox(
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
                    ),
                  ),
                  gapH8,
                  Text(
                    eventTypes[index].title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
