import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dogadjaj_ba/models/ticket_model.dart';
import 'package:dogadjaj_ba/models/user.dart';
import 'package:dogadjaj_ba/models/event.dart';
import 'package:dogadjaj_ba/providers/ticket_provider.dart';
import 'package:dogadjaj_ba/providers/user_provider.dart';
import 'package:dogadjaj_ba/providers/eventprovider.dart';

class AddTicketScreen extends StatefulWidget {
  final Ticket? ticket;

  const AddTicketScreen({Key? key, this.ticket}) : super(key: key);

  @override
  _AddTicketScreenState createState() => _AddTicketScreenState();
}

class _AddTicketScreenState extends State<AddTicketScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TicketProvider ticketProvider = TicketProvider();
  final UserProvider userProvider = UserProvider();
  final EventProvider eventProvider = EventProvider();

  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController ticketNumberController = TextEditingController();
  final TextEditingController availableController = TextEditingController();
  int? selectedUserId;
  int? selectedEventId;
  List<User> users = [];
  List<Event> events = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
    fetchEvents();

    if (widget.ticket != null) {
     
      selectedUserId = widget.ticket!.userId;
      selectedEventId = widget.ticket!.eventId;
      priceController.text = widget.ticket!.cijena?.toString() ?? '';
      descriptionController.text = widget.ticket!.description ?? '';
      titleController.text = widget.ticket!.title ?? '';
      ticketNumberController.text = widget.ticket!.ticketNumber ?? '';
      availableController.text = widget.ticket!.available.toString();
    }
  }

  Future<void> fetchUsers() async {
    try {
      users = await userProvider.getAll();
      setState(() {});
    } catch (e) {
      
    }
  }

  Future<void> fetchEvents() async {
    try {
      events = await eventProvider.get();
      setState(() {});
    } catch (e) {
    
    }
  }

  void clearForm() {
    priceController.clear();
    descriptionController.clear();
    titleController.clear();
    ticketNumberController.clear();
    availableController.clear();
    setState(() {
      selectedUserId = null;
      selectedEventId = null;
    });
  }

  Future<bool> saveTicket() async {
    if (_formKey.currentState!.validate()) {
      try {
        Ticket newTicket = Ticket(
          ticketId: widget.ticket?.ticketId ?? 0, 
          userId: selectedUserId!,
          eventId: selectedEventId!,
          cijena: double.tryParse(priceController.text),
          description: descriptionController.text,
          title: titleController.text,
          ticketNumber: ticketNumberController.text,
          available: int.tryParse(availableController.text) ?? 0,
        );

        bool result;
        if (widget.ticket == null) {
          result = await ticketProvider.insertTickets(newTicket);
        } else {
          result = await ticketProvider.updateTicket(newTicket);
        }

        if (result) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Čestitamo"),
                content: Text(widget.ticket == null ? "Dodali ste kartu!" : "Ažurirali ste kartu!"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop(true); 
                    },
                    child: Text("OK"),
                  ),
                ],
              );
            },
          );
          clearForm();
          return true;
        } else {
          return false;
        }
      } catch (e) {
        return false;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ticket == null ? 'Dodaj Kartu' : 'Uredi Kartu'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<int>(
                value: selectedUserId,
                onChanged: (value) {
                  setState(() {
                    selectedUserId = value!;
                  });
                },
                items: users
                    .map((user) => DropdownMenuItem<int>(
                          value: user.id,
                          child: Text(user.korisnickoIme),
                        ))
                    .toList(),
                decoration: const InputDecoration(labelText: 'Korisnicko Ime'),
                validator: (value) {
                  if (value == null) {
                    return 'Odaberite korisnicko ime!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<int>(
                value: selectedEventId,
                onChanged: (value) {
                  setState(() {
                    selectedEventId = value!;
                  });
                },
                items: events
                    .map((event) => DropdownMenuItem<int>(
                          value: event.eventId,
                          child: Text(event.eventName ?? '--'),
                        ))
                    .toList(),
                decoration: const InputDecoration(labelText: 'Event Name'),
                validator: (value) {
                  if (value == null) {
                    return 'Odaberite event!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: priceController,
                decoration: const InputDecoration(labelText: 'Cijena'),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Unesite cijenu! Samo brojevi su dozvoljeni!';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Samo brojevi su dozvoljeni!';
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
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Naziv karte'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Unesite naziv karte!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: ticketNumberController,
                decoration: const InputDecoration(labelText: 'Broj karte'),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Unesite broj karte! Samo brojevi su dozvoljeni!';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Samo brojevi su dozvoljeni!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: availableController,
                decoration: const InputDecoration(labelText: 'Dostupno'),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Unesite dostupno! Samo brojevi su dozvoljeni!';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Samo brojevi su dozvoljeni!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () async {
                  await saveTicket();
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
