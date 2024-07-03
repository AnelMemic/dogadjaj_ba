import 'package:dogadjaj_ba/helpers/erorrDialog.dart';
import 'package:dogadjaj_ba/models/post.dart';
import 'package:dogadjaj_ba/providers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:dogadjaj_ba/models/ticket_model.dart';
import 'package:dogadjaj_ba/models/user.dart';
import 'package:dogadjaj_ba/models/event.dart';
import 'package:dogadjaj_ba/providers/ticket_provider.dart';
import 'package:dogadjaj_ba/providers/user_provider.dart';

class AddPostScreen extends StatefulWidget {
  final Ticket? ticket;

  const AddPostScreen({Key? key, this.ticket}) : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TicketProvider ticketProvider = TicketProvider();
  final UserProvider userProvider = UserProvider();
  late PostProvider postProvider = PostProvider();

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

       postProvider = PostProvider();

  
  }

  Future<void> fetchUsers() async {
    try {
      users = await userProvider.getAll();
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

 void InsertNotification() async {
    try {
      var post = {
        "id": 0,
        "title": titleController.text,
        "content": descriptionController.text,
        "publishDate": DateTime.now().toUtc().toIso8601String(),
      };
      var response = await postProvider.insertPost(post);
      if (response == "OK") {
         showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Čestitamo"),
                content: Text(widget.ticket == null ? "Dodali ste post!" : "Ažurirali ste post!"),
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
      }
    } on Exception catch (e) {
      showErrorDialog(context, e.toString().substring(11));
    }
   }

  Future<bool> saveTicket() async {
    if (_formKey.currentState!.validate()) {
      try {
        Post newTicket = Post(
          content: descriptionController.text,
          title: titleController.text,
          publishDate: DateTime.now(), id: 0,
        );

        bool result;
        if (widget.ticket == null) {
          result = await postProvider.insertTickets(newTicket);
        } else {
          result = await postProvider.updateTicket(newTicket);
        }

        if (result) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Čestitamo"),
                content: Text(widget.ticket == null ? "Dodali ste post!" : "Ažurirali ste post!"),
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
             
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Naslov'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Unesite naslov!';
                  }
                  return null;
                },
              ),
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
              
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () async {
                  InsertNotification();
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
