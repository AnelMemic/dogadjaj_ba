import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/helpers/error_dialog.dart';
import 'package:mobile/models/SearchObjects/ticket_search_object.dart';
import 'package:mobile/models/ticket.dart';
import 'package:mobile/providers/ticket_provider.dart';
import 'package:mobile/providers/user_provider.dart';
import 'package:mobile/providers/user_ticket_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'package:intl/intl.dart';

class KupiKartuDialog extends StatefulWidget {
  final int? eventId;

  KupiKartuDialog({Key? key, required this.eventId}) : super(key: key);

  @override
  _KupiKartuDialogState createState() => _KupiKartuDialogState();
}

class _KupiKartuDialogState extends State<KupiKartuDialog> {
  List<Ticket> packages = <Ticket>[];
  late TicketProvider _ticketProvider;
  late UserTicketProvider _userTicketProvider;
  late UserProvider _userProvider;
  Ticket? _selectedTicket;
  int? _numberOfTickets;
  int currentPage = 1;
  int pageSize = 1000;
  int? _userId;
  Map<String, dynamic>? paymentIntent;

  @override
  void initState() {
    super.initState();
    _ticketProvider = context.read<TicketProvider>();
    _userProvider = context.read<UserProvider>();
    _userTicketProvider = context.read<UserTicketProvider>();
    loadTickets();
  }

  void loadTickets() async {
    try {
      var response = await _ticketProvider.getPaged(
          searchObject:
              TicketSearchObject(PageNumber: currentPage, PageSize: pageSize));

      setState(() {
        packages = response;
      });
    } on Exception catch (e) {
      showErrorDialog(context, e.toString().substring(11));
    }
  }

  double calculateTotalPrice() {
    if (_selectedTicket != null && _numberOfTickets != null) {
      double basePrice = _selectedTicket!.cijena! * _numberOfTickets!;

      return basePrice;
    }
    return 0;
  }
   void loadUser() async {
    var id = _userProvider.getUserId();
    _userId = id;
  }

  void InsertUserPackage() async {
    try {
      loadUser();

      var newUserTicket = {
        "userId": _userId,
        "ticketId": _selectedTicket!.ticketId,
        "kolicina": _numberOfTickets
      };

      var userPackage = await _userTicketProvider.insert(newUserTicket);

      if (userPackage == "OK") {
        currentPage == 1;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Color(0XFF12B422),
              content: Text('Uspjesno kupljeno ulaznica: $_numberOfTickets.',
                  style: TextStyle(
                    color: Colors.white,
                  ))),
        );
      }
    } on Exception catch (e) {
      showErrorDialog(context, e.toString().substring(11));
    }
  }

  showPaymentSheet() async {
    if (_selectedTicket == null ||
        _numberOfTickets == null ||
        _numberOfTickets == 0) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: black,
          content: Text(
            "Molimo odaberite ulaznicu i broj ulaznica.",
            style: TextStyle(color: white),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "OK",
              ),
            ),
          ],
        ),
      );
      return;
    }

    var paymentIntentData = await createPaymentIntent(
        (calculateTotalPrice() * 100).round().toString(), 'BAM');
    await Stripe.instance
        .initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntentData!['client_secret'],
            merchantDisplayName: 'dogadjajBa',
            appearance: const PaymentSheetAppearance(
              primaryButton: PaymentSheetPrimaryButtonAppearance(
                  colors: PaymentSheetPrimaryButtonTheme(
                      light: PaymentSheetPrimaryButtonThemeColors(
                          background: Colors.teal))),
            ),
          ),
        )
        .then((value) {})
        .onError((error, stackTrace) {
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("Poništena transakcija"),
              ));
    });

    try {
      await Stripe.instance.presentPaymentSheet();

      InsertUserPackage();
    } catch (e) {
      //silent
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization': 'Bearer $stripeSecretKey',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      return jsonDecode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30.0, left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        color: kBackgroundColor.withOpacity(0.97),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              _buildTitle(),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: DropdownButton<Ticket>(
                        dropdownColor: black,
                        value: _selectedTicket,
                        items: packages.map((Ticket ticket) {
                          return DropdownMenuItem<Ticket>(
                            value: ticket,
                            child: Text(
                              '${ticket.title} -${ticket.cijena}KM ' ?? '',
                              style: TextStyle(color: white),
                            ),
                          );
                        }).toList(),
                        onChanged: (Ticket? selectedTicket) {
                          setState(() {
                            _selectedTicket = selectedTicket;
                          });
                        },
                        hint: Text(
                          'Izaberite ulaznicu',
                          style: TextStyle(color: white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: DropdownButton<int>(
                        dropdownColor: black,
                        value: _numberOfTickets,
                        items: List.generate(10, (index) {
                          return DropdownMenuItem<int>(
                            value: index + 1,
                            child: Text(
                              '${index + 1} kom',
                              style: TextStyle(color: white),
                            ),
                          );
                        }),
                        onChanged: (int? numberOfTickets) {
                          setState(() {
                            _numberOfTickets = numberOfTickets;
                          });
                        },
                        hint: Text('Izaberite broj ulaznica',
                            style: TextStyle(color: white)),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Ukupno',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      NumberFormat.currency(locale: 'bs')
                          .format(calculateTotalPrice()),
                      style: const TextStyle(
                          color: Color.fromARGB(255, 230, 255, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Zatvori",
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showPaymentSheet();
                        },
                        child: Text(
                          "Uplati",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          "Uplata ulaznice",
          style: TextStyle(
            color: white,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
