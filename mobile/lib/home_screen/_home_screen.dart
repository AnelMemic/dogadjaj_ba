import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/custom%20widgets/logo_widget.dart';
import '../lists/event_types_list.dart';
import '../models/test_models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(
            flex: 1,
          ),
          const LogoWidget(),
          gapH32,
          Container(
            width: double.infinity,
            height: 200,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 94, 92, 92)),
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 30, right: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Događaji',
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Expanded(
                      child: EventTypesList(
                    eventTypes: eventTypes,
                  ))
                ],
              ),
            ),
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            height: 180,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 94, 92, 92)),
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 30, right: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Uskoro',
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        scale: 5,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            gapH56,
                            Text(
                              'Home garden & interior design',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              'Sajam za Uredjenje Doma',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              'Mostar, 01.06.2023.',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
