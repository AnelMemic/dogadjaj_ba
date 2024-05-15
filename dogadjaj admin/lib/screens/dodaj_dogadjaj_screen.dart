import 'package:dogadjaj_ba/helpers/erorrDialog.dart';
import 'package:dogadjaj_ba/models/event.dart';
import 'package:dogadjaj_ba/providers/eventprovider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DodajDogadjajScreen extends StatefulWidget {
  const DodajDogadjajScreen({Key? key}) : super(key: key);

  @override
  State<DodajDogadjajScreen> createState() => _DodajDogadjajScreenState();
}

class _DodajDogadjajScreenState extends State<DodajDogadjajScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

  void clearForm() {
    nameController.clear();
    locationIdController.clear();
    descriptionController.clear();
    eventDateController.clear();
    setState(() {
      selectedEventType = 1;
      selectedsubEventType = 1;
      endDate = DateTime.now();
    });
  }

  Future<bool> insertEvent() async {
    if (_formKey.currentState!.validate()) {
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
        await eventProvider.insert(newEvent).then((value) {
          if (value != null) {
            return true;
          }
        });
        return true;
      } on Exception catch (e) {
        showErrorDialog(context, e.toString().substring(11));
        return false;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dodaj Novi Dogadjaj'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Naziv'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Unesite naziv!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: locationIdController,
                decoration: const InputDecoration(labelText: 'Lokacija ID'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Unesite lokacija ID!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Opis'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Unesite opis!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: eventDateController,
                decoration: const InputDecoration(
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
                items: const [
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
                items: const [
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
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () async {
                  await insertEvent().then((value) {
                    clearForm();
                    Navigator.of(context).pop();
                  });
                },
                child: const Text('Save to Database'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
