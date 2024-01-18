import 'dart:convert';
import 'package:dogadjaj_ba/constants.dart';
import 'package:dogadjaj_ba/helpers/error_dialog.dart';
import 'package:dogadjaj_ba/helpers/theme_helper.dart';
import 'package:dogadjaj_ba/models/ticket.dart';
import 'package:dogadjaj_ba/providers/ticket_provider.dart';
import 'package:dogadjaj_ba/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class TicketPaymentForm extends StatefulWidget {
  @override
  _TicketPaymentFormState createState() => _TicketPaymentFormState();
}

class _TicketPaymentFormState extends State<TicketPaymentForm> {
  List<Ticket> tickets = <Ticket>[];
  // late UserPackageProvider _userPackageProvider;
  late TicketProvider _ticketProvider;
  late UserProvider _userProvider;
  Ticket? _selectedTicket;
  int? _selectedTickets;
  int currentPage = 1;
  int pageSize = 1000;
  int? _userId;
  Map<String, dynamic>? paymentIntent;

  @override
  void initState() {
    super.initState();
    _ticketProvider = context.read<TicketProvider>();
    _userProvider = context.read<UserProvider>();
    loadTickets();
  }

  // void loadUser() async {
  //   var id = _userProvider.getUserId();
  //   _userId = id;
  // }

  void loadTickets() async {
    try {
      var response = await _ticketProvider.get();

      setState(() {
        tickets = response;
      });
    } on Exception catch (e) {
      showErrorDialog(context, e.toString().substring(11));
    }
  }

  double calculateTotalPrice() {
    if (_selectedTicket != null && _selectedTickets != null) {
      double basePrice = _selectedTicket!.cijena! * _selectedTickets!;

      // Popustna osnovu broja mjeseci
      if (_selectedTickets! >= 6 && _selectedTickets! < 12) {
        // Popust od 5% za više od 6 i manje od 12 mjeseci
        return basePrice * 0.95;
      } else if (_selectedTickets! == 12) {
        // Popust od 10% za 12 mjeseci
        return basePrice * 0.9;
      }

      // Nema popusta za manje od 6 mjeseci
      return basePrice;
    }
    return 0;
  }

  showPaymentSheet() async {
    if (_selectedTicket == null || _selectedTickets == null) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor:  appTheme.bgSecondary,
          content: Text("Molimo odaberite paket i broj mjeseci."),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: teal,
              ),
              child: Text(
                "OK",
                style: TextStyle(color: white),
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
            merchantDisplayName: 'GymFit',
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

      // InsertUserPackage();
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

  DateTime calculateExpirationDate(int months) {
    DateTime currentDate = DateTime.now();

    DateTime expirationDate = currentDate.add(Duration(days: 30 * months));

    return expirationDate;
  }

  


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30.0, left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        color: appTheme.bgSecondary.withOpacity(0.97),
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
                        dropdownColor: teal,
                        value: _selectedTicket,
                        items: tickets.map((Ticket ticket) {
                          return DropdownMenuItem<Ticket>(
                            value: ticket,
                            child: Text(ticket.ticketId.toString()),
                          );
                        }).toList(),
                        onChanged: (Ticket? selectedPackage) {
                          setState(() {
                            _selectedTicket = selectedPackage;
                          });
                        },
                        hint: Text('Izaberite kartu', style: TextStyle(color: white),),
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
                        dropdownColor: teal,
                        value: _selectedTickets,
                        items: List.generate(12, (index) {
                          return DropdownMenuItem<int>(
                            value: index + 1,
                            child: Text('${index + 1} months'),
                          );
                        }),
                        onChanged: (int? ticketsNumber) {
                          setState(() {
                            _selectedTickets = ticketsNumber;
                          });
                        },
                        hint: Text('Izaberite broj mjeseci',style: TextStyle(color: white)),
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
                          color: Color(0XFF12B422),
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
                        style: ElevatedButton.styleFrom(
                          backgroundColor: teal,
                        ),
                        child: Text(
                          "Zatvori",
                          style: TextStyle(color: white),
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showPaymentSheet();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: teal,
                        ),
                        child: Text(
                          "Uplati",
                          style: TextStyle(color: white),
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
          "Uplata članarine",
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