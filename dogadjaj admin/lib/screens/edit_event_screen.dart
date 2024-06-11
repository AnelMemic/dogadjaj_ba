import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dogadjaj_ba/models/event.dart';
import 'package:dogadjaj_ba/providers/eventprovider.dart';
import 'package:dogadjaj_ba/helpers/erorrDialog.dart';
import 'dart:developer' as developer;

class EditEventScreen extends StatefulWidget {
  final Event event;

  const EditEventScreen({Key? key, required this.event}) : super(key: key);

  @override
  _EditEventScreenState createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final EventProvider eventProvider = EventProvider();

  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late TextEditingController eventDateController;
  late int selectedEventType;
  late int selectedsubEventType;
  late int? lokacijaId;
  DateTime endDate = DateTime.now();
  List<Map<String, dynamic>> locations = [];

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.event.eventName);
    descriptionController = TextEditingController(text: widget.event.opis);
    eventDateController = TextEditingController(
        text: DateFormat('yyyy-MM-dd').format(widget.event.eventDate!));
    selectedEventType = widget.event.eventType ?? 1;
    selectedsubEventType = widget.event.subType ?? 1;
    endDate = widget.event.eventDate ?? DateTime.now();
    lokacijaId = widget.event.lokacijaId;
    fetchLocations();
  }

  Future<void> fetchLocations() async {
    try {
      locations = await eventProvider.getLocations();
      setState(() {});
    } catch (e) {
      showErrorDialog(context, "Failed to load locations");
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    eventDateController.dispose();
    super.dispose();
  }

  Future<bool> updateEvent() async {
    if (_formKey.currentState!.validate()) {
      try {
        Event updatedEvent = Event(
          eventId: widget.event.eventId,
          eventName: nameController.text,
          eventDate: endDate,
          opis: descriptionController.text,
          stateMachine: widget.event.stateMachine ?? 'draft', 
          eventType: selectedEventType,
          subType: selectedsubEventType,
          lokacijaId: lokacijaId,
        );

        
        developer.log('Updating event: ${updatedEvent.toJson()}');

        var result = await eventProvider.update(widget.event.eventId, updatedEvent);
        if (result != null) {
          return true;
        }
        return false;
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
        title: const Text('Uredi Dogadjaj'),
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
              const SizedBox(height: 16.0),
              DropdownButtonFormField<int>(
                value: lokacijaId,
                onChanged: (value) {
                  setState(() {
                    lokacijaId = value!;
                  });
                },
                items: locations
                    .map((location) => DropdownMenuItem<int>(
                          value: location['id'],
                          child: Text(location['nazivObjekta']),
                        ))
                    .toList(),
                decoration: const InputDecoration(labelText: 'Lokacija'),
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (await updateEvent()) {
                    Navigator.of(context).pop(true);
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
