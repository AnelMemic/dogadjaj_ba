import 'package:dogadjaj_ba/constants.dart';
import 'package:dogadjaj_ba/event_info_card.dart';
import 'package:dogadjaj_ba/single_event_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'modals/purchase_confirmation_dialog.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  TextEditingController cardNameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  String selectedDate = '1';
  String selectedYear = '2023';
  TextEditingController cvvController = TextEditingController();

  List<String> dateOptions =
      List.generate(31, (index) => (index + 1).toString());
  List<String> yearOptions =
      List.generate(51, (index) => (2023 + index).toString());

  @override
  void dispose() {
    cardNameController.dispose();
    cardNumberController.dispose();

    cvvController.dispose();
    super.dispose();
  }

  InputBorder customInputBorder() {
    return const UnderlineInputBorder(
      borderSide:
          BorderSide(color: Colors.white), // Change the border color to white
    );
  }

  @override
  Widget build(BuildContext context) {
    var events = ref.watch(eventSenderProvider);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: events != null
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(
                      'assets/images/logo.png',
                      scale: 3,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: events.length,
                    itemBuilder: (BuildContext context, int index) {
                      return EventInfoCard(event: events[index]);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50, bottom: 50),
                    child: Column(
                      children: [
                        TextFormField(
                          style: const TextStyle(color: Colors.grey),
                          controller: cardNameController,
                          decoration: InputDecoration(
                              enabledBorder: customInputBorder(),
                              focusedBorder: customInputBorder(),
                              label: const Text('Card Name'),
                              hintText: 'Enter card name',
                              hintStyle: const TextStyle(color: Colors.grey),
                              labelStyle: const TextStyle(color: Colors.white)),
                        ),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: cardNumberController,
                          decoration: InputDecoration(
                            enabledBorder: customInputBorder(),
                            focusedBorder: customInputBorder(),
                            label: const Text('Enter Card Number'),
                            hintText: '0000-0000-0000-0000',
                            hintStyle: const TextStyle(color: Colors.grey),
                            labelStyle: const TextStyle(color: Colors.white),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        gapH32,
                        Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                dropdownColor: Colors.grey,
                                isDense: true,
                                items: dateOptions.map((date) {
                                  return DropdownMenuItem<String>(
                                    value: date,
                                    child: Text(date,
                                        style: const TextStyle(
                                            color: Colors.white)),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedDate = value!;
                                  });
                                },
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(0.0),
                                  label: const Text('Date'),
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                  enabledBorder: customInputBorder(),
                                  focusedBorder: customInputBorder(),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                isDense: true,
                                items: yearOptions.map((year) {
                                  return DropdownMenuItem<String>(
                                    value: year,
                                    child: Text(year,
                                        style: const TextStyle(
                                            color: Colors.white)),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedYear = value!;
                                  });
                                },
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(0.0),
                                  label: const Text('Year'),
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                  enabledBorder: customInputBorder(),
                                  focusedBorder: customInputBorder(),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Expanded(
                              child: TextFormField(
                                style: const TextStyle(color: Colors.white),
                                maxLines: 1,
                                controller: cvvController,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(0.0),
                                  label: const Text('CVV'),
                                  hintText: 'Enter CVV',
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                  enabledBorder: customInputBorder(),
                                  focusedBorder: customInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.redAccent,
                    child: InkWell(
                      onTap: () {
                        showCustomDialog(context);
                      },
                      child: Center(
                        child: Text(
                          'PLATI'.toUpperCase(),
                          style: const TextStyle(fontSize: 28),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: Image.asset(
                      'assets/images/logo.png',
                      scale: 2,
                    ),
                  ),
                  const Text(
                    'You shopping cart is empty!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
    );
  }
}
