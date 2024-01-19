import 'package:dogadjaj_ba/helpers/erorrDialog.dart';
import 'package:dogadjaj_ba/models/event.dart';
import 'package:dogadjaj_ba/providers/eventprovider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DodajDogadjajScreen extends StatefulWidget {
  const DodajDogadjajScreen({Key? key}) : super(key: key);

  @override
  _DodajDogadjajScreenState createState() => _DodajDogadjajScreenState();
}

class _DodajDogadjajScreenState extends State<DodajDogadjajScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationIdController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController eventDateController = TextEditingController();
  final TextEditingController eventTypeController = TextEditingController();
  final TextEditingController subTypeController = TextEditingController();
  final EventProvider eventProvider = EventProvider();
  int selectedEventType = 1;
  int selectedsubEventType = 1;
  DateTime endDate = DateTime.now();
  void insertEvent() async {
    try {
      var newEvent = {
        "eventName": nameController.text,
        "lokacijaId": locationIdController.text,
        "eventDate": endDate.toUtc().toIso8601String(),
        "opis": descriptionController.text,
        "stateMachine": "string",
        "eventType": selectedEventType,
        "subType": selectedsubEventType
      };
      var event = await eventProvider.insert(newEvent);
      if (event == "OK") {
        Navigator.of(context).pop();
      }
    } on Exception catch (e) {
      showErrorDialog(context, e.toString().substring(11));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dodaj Novi Dogadjaj'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Naziv'),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: locationIdController,
              decoration: const InputDecoration(labelText: 'Lokacija ID'),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Opis'),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: eventDateController,
              decoration: InputDecoration(
                labelText: 'Datum',
                hintText: 'Odaberite datum',
              ),
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: endDate,
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2101),
                ).then((date) {
                  if (date != null) {
                    setState(() {
                      endDate = date;
                      eventDateController.text =
                          DateFormat('yyyy-MM-dd').format(date);
                    });
                  }
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Unesite datum!';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            DropdownButtonFormField<int>(
              value: selectedEventType,
              onChanged: (value) {
                setState(() {
                  selectedEventType = value!;
                });
              },
              items: [
                DropdownMenuItem<int>(
                  value: 1,
                  child: Text('Konferencija'),
                ),
                DropdownMenuItem<int>(
                  value: 2,
                  child: Text('Kongres'),
                ),
                DropdownMenuItem<int>(
                  value: 3,
                  child: Text('Seminar'),
                ),
                DropdownMenuItem<int>(
                  value: 6,
                  child: Text('Sajmovi'),
                ),
              ],
              decoration: const InputDecoration(labelText: 'Event type'),
            ),
            DropdownButtonFormField<int>(
              value: selectedsubEventType,
              onChanged: (value) {
                setState(() {
                  selectedsubEventType = value!;
                });
              },
              items: [
                DropdownMenuItem<int>(
                  value: 1,
                  child: Text('Gradjevinarstvo'),
                ),
                DropdownMenuItem<int>(
                  value: 2,
                  child: Text('IT'),
                ),
              ],
              decoration: const InputDecoration(labelText: 'subEvent type'),
            ),
            ElevatedButton(
              onPressed: () async {
                insertEvent();

                // try {
                //   // Create a new Event instance using the form data
                //   Event newEvent = Event(
                //       eventId:
                //           0, // Set to 0 or null if it's an insert operation
                //       eventName: nameController.text,
                //       lokacijaId: int.tryParse(locationIdController.text),
                //       opis: descriptionController.text,
                //       eventDate: DateTime.tryParse(eventDateController.text),
                //       stateMachine: 'draft',
                //       eventType: 1,
                //       subType: 1);

                //   // Call the saveEvent method from your EventProvider
                //   await eventProvider.saveEvent(newEvent);

                //   // Show a success message
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(
                //       content: Text('Event saved successfully!'),
                //     ),
                //   );

                //   nameController.clear();
                //   locationIdController.clear();
                //   descriptionController.clear();
                //   eventDateController.clear();
                // } catch (e) {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(
                //       content: Text('Error saving event: $e'),
                //       backgroundColor: Colors.red,
                //     ),
                //   );
                // }
              },
              child: const Text('Save to Database'),
            ),
          ],
        ),
      ),
    );
  }
}
