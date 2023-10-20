import 'package:dogadjaj_ba/constants.dart';
import 'package:dogadjaj_ba/lists/events_in_categories_list.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../models/test_models.dart';

class EventCategoriesListScreen extends StatefulWidget {
  final EventType eventType;

  const EventCategoriesListScreen({
    super.key,
    required this.eventType,
  });

  @override
  State<EventCategoriesListScreen> createState() =>
      _EventCategoriesListScreenState();
}

class _EventCategoriesListScreenState extends State<EventCategoriesListScreen> {
  _EventCategoriesListScreenState();

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
                      widget.eventType.title.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: eventCategories.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () => PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: EventsInCategoriesListScreen(
                                eventCategory: eventCategories[index]),
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          ),
                          child: Container(
                            height: 150,
                            color: eventCategories[index].color,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Center(
                                child: Text(
                                  eventCategories[index].title,
                                  style: const TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
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
