import 'package:flutter/material.dart';
import 'package:mobile/single_event_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'constants.dart';
import 'models/test_models.dart';

class EventInfoCard extends StatelessWidget {
  final Event event;
  const EventInfoCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: InkWell(
          onTap: () => PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: SingleEventScreen(
                  event: event,
                ),
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              ),
          child: Container(
            height: 135,
            color: event.color,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/images/fllogo.jpg',
                    scale: 6,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 220,
                        child: Text(
                          event.eventName.toUpperCase(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          gapW8,
                          Text(
                            event.location,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.date_range_outlined,
                            color: Colors.white,
                          ),
                          gapW8,
                          Text(
                            event.date,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
