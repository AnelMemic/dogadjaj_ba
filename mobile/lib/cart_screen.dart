import 'package:dogadjaj_ba/cart_payment.dart';
import 'package:dogadjaj_ba/cart_screen.dart';
import 'package:dogadjaj_ba/constants.dart';
import 'package:dogadjaj_ba/helpers/app_decoration.dart';
import 'package:dogadjaj_ba/helpers/error_dialog.dart';
import 'package:dogadjaj_ba/helpers/theme_helper.dart';
import 'package:dogadjaj_ba/models/SearchObjects/ticket_search_object.dart';
import 'package:dogadjaj_ba/models/ticket.dart';
import 'package:dogadjaj_ba/providers/ticket_provider.dart';
import 'package:dogadjaj_ba/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TicketsScreen extends StatefulWidget {
  @override
  _TicketsScreenState createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen> {
  late MediaQueryData mediaQueryData;

  late UserProvider _loginProvider;
  late TicketProvider _ticketProvider;
  int currentPage = 1;
  int pageSize = 1000000;
  int? _userId;
  int? _eventId;
  bool? _expired = false;
  int _status = 1;
  List<Ticket> _userTickets = <Ticket>[];
  List<Ticket> _tickets = <Ticket>[];

  @override
  void initState() {
    super.initState();
    _loginProvider = context.read<UserProvider>();
    _ticketProvider = context.read<TicketProvider>();
    loadUser();
    loadTickets();
  }

  void loadUser() async {
    var id = _loginProvider.getUserId();
    _userId = id;
  }

 void loadTickets() async {
    try {
      
      var Response =
          await _ticketProvider.get();
      if (mounted) {
        setState(() {
          _tickets = Response;
        });
      }
    } on Exception catch (e) {
      showErrorDialog(context, e.toString().substring(11));
    }
  }

  // void loadUserTickets() async {
  //   try {
  //     loadUser();
  //   TicketSearchObject searchObject = TicketSearchObject(
  //         eventId: _eventId,
  //         PageNumber: currentPage,
  //         PageSize: pageSize,
  //         userId: _userId);
  //     var Response =
  //         await _ticketProvider.getPaged(searchObject: searchObject);
  //     if (mounted) {
  //       setState(() {
  //         _userTickets = Response;
  //       });
  //     }
  //   } on Exception catch (e) {
  //     showErrorDialog(context, e.toString().substring(11));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Column(
          children: [
           
            Container(
              height: 1.0,
              color: const Color.fromARGB(255, 214, 214, 214),
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                _buildStatusButton(1, "Aktivna"),
                _buildStatusButton(2, "Istekle"),
              ],
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 5,
                  right: 5,
                ),
                child: Column(
                  children: [_buildUserPackageInfo(context)],
                ),
              ),
            ),
            Spacer(),
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.all(16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: teal),
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return TicketPaymentForm();
                    },
                  );
                },
                child: Text(
                  'Uplati članarinu',
                  style: TextStyle(color: white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserPackageInfo(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: AppDecoration.fillBlack.copyWith(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: _tickets.length,
        itemBuilder: (context, index) {
          // return Container(
          //   padding: EdgeInsets.all(5),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Expanded(
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             if (_tickets[index].package != null) ...[
          //               Text(
          //                 'Paket: ${_userPackages[index].package!.name} ',
          //                 style: const TextStyle(
          //                   fontWeight: FontWeight.bold,
          //                   color: Colors.white, // White text color
          //                 ),
          //               ),
          //             ],
          //             _buildUserPaackageData('Datum aktivacije:',
          //                 '${_formatDate(_tickets[index]!.cijena!)}'),
          //             _buildUserPaackageData('Datum isteka:',
          //                 '${_formatDate(_userPackages[index].expirationDate)}'),
          //             Divider()
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // );
        },
      ),
    );
  }

  Widget _buildUserPaackageData(String label, String value) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              value,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        SizedBox(height: 2),
      ],
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) {
      return '';
    }
    return DateFormat('dd.MM.yyyy').format(date);
  }

  Expanded _buildStatusButton(int status, String label) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: _status == status ? Colors.teal : Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          padding: EdgeInsets.all(2),
          minimumSize: Size(2, 40),
          elevation: 0,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: () {
          setState(() {
            _status = status;
            _expired = status == 2;
            loadTickets();
          });
        },
        child: Text(
          label,
          style: TextStyle(color: white, fontSize: 12),
        ),
      ),
    );
  }
}
