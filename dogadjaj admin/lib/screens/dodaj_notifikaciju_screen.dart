import 'package:dogadjaj_ba/helpers/erorrDialog.dart';
import 'package:dogadjaj_ba/models/event.dart';
import 'package:dogadjaj_ba/models/user.dart';
import 'package:dogadjaj_ba/providers/eventprovider.dart';
import 'package:dogadjaj_ba/providers/notification_provider.dart';
import 'package:dogadjaj_ba/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DodajNotifikacijuScreen extends StatefulWidget {
  const DodajNotifikacijuScreen({Key? key}) : super(key: key);

  @override
  _DodajNotifikacijuScreenState createState() =>
      _DodajNotifikacijuScreenState();
}

class _DodajNotifikacijuScreenState extends State<DodajNotifikacijuScreen> {
  final TextEditingController _contentController = TextEditingController();
  late NotificationProvider _notificationProvider = NotificationProvider();
  late UserProvider _userProvider;

  int selectedEventType = 1;
  int selectedsubEventType = 1;
  DateTime endDate = DateTime.now();
  List<User> users = <User>[];

  @override
  void initState() {
    super.initState();
    _notificationProvider = context.read<NotificationProvider>();
    _userProvider = context.read<UserProvider>();
    loadUsers();
  }

  void loadUsers() async {
    try {
      var usersResponse = await _userProvider.getAll();
      setState(() {
        users = usersResponse;
      });
    } on Exception catch (e) {
      showErrorDialog(context, e.toString().substring(11));
    }
  }

  void insertNotification(int id) async {
    try {
      var newNotification = {
        "id": 0,
        "content": _contentController.text.toString(),
        "read": false,
        "deleted": false,
        "dateRead": null,
        "sendOnDate": DateTime.now().toUtc().toIso8601String(),
        "userId": id
      };
      var event = await _notificationProvider.sendRabbitNotification(newNotification);
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
        title: const Text('Kreiraj novu obavijest'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _contentController,
              decoration:
                  const InputDecoration(labelText: 'Sadrzaj obavijesti'),
            ),
            const SizedBox(height: 16.0),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                for (var user in users) {
                  insertNotification(user.id!);
                }
                Navigator.of(context).pop();
              },
              child: const Text('Save to Database'),
            ),
          ],
        ),
      ),
    );
  }
}
