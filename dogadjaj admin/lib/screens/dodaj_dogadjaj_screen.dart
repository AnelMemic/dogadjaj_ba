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
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController eventDateController = TextEditingController();
  final TextEditingController eventTypeController = TextEditingController();
  final TextEditingController subTypeController = TextEditingController();
  final EventProvider eventProvider = EventProvider();
  int selectedEventType = 1;
  int selectedsubEventType = 1;
  DateTime endDate = DateTime.now();
  String? selectedLocation;
  List<Map<String, dynamic>> locations = [];
  Map<int, String> gradNames = {};

  @override
  void initState() {
    super.initState();
    fetchLocationsAndGradNames();
  }

  void clearForm() {
    nameController.clear();
    descriptionController.clear();
    eventDateController.clear();
    setState(() {
      selectedEventType = 1;
      selectedsubEventType = 1;
      endDate = DateTime.now();
      selectedLocation = null;
    });
  }

  Future<void> fetchLocationsAndGradNames() async {
    try {
      var fetchedLocations = await eventProvider.getLocations();
      Set<int> uniqueGradIds = {};
      for (var location in fetchedLocations) {
        uniqueGradIds.add(location['gradId']);
      }
      for (var gradId in uniqueGradIds) {
        var grad = await eventProvider.getGrad(gradId);
        print('Fetched grad: $grad'); 
        gradNames[gradId] = grad['imeGrada'] ?? 'Unknown';
      }
      print('Locations: $fetchedLocations');  
      print('Grad Names: $gradNames');  
      setState(() {
        locations = fetchedLocations;
      });
    } catch (e) {
      showErrorDialog(context, 'Failed to load locations and grad names');
    }
  }

  Future<void> showSuccessSnackbar() async {
    final snackBar = SnackBar(
      content: const Text('You successfully saved to database'),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> insertEvent() async {
    if (_formKey.currentState!.validate()) {
      try {
        var newEvent = {
          "eventName": nameController.text,
          "lokacijaId": selectedLocation,
          "eventDate": endDate.toUtc().toIso8601String(),
          "opis": descriptionController.text,
          "stateMachine": "string",
          "eventType": selectedEventType,
          "subType": selectedsubEventType
        };
        await eventProvider.insert(newEvent).then((value) {
          if (value != null) {
            clearForm();
            showSuccessSnackbar();
          }
        });
      } on Exception catch (e) {
        showErrorDialog(context, e.toString().substring(11));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dodaj Novi Dogadjaj'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(true);  
          },
        ),
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
              DropdownButtonFormField<String>(
                value: selectedLocation,
                onChanged: (value) {
                  setState(() {
                    selectedLocation = value!;
                  });
                },
                items: locations.map((location) {
                  return DropdownMenuItem<String>(
                    value: location['id'].toString(),
                    child: Text(
                      '${location['nazivObjekta']} - ${gradNames[location['gradId']] ?? 'Unknown'}'
                    ),
                  );
                }).toList(),
                decoration: const InputDecoration(labelText: 'Lokacija'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Odaberite lokaciju!';
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
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),  
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
                  if (DateTime.parse(value).isBefore(DateTime.now())) {
                    return 'Datum ne može biti u prošlosti!';
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
                decoration: const InputDecoration(labelText: 'Sub type'),
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () async {
                  await insertEvent();
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
