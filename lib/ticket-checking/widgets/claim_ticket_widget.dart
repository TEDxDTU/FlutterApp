import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:tedx_dtu_app/events/widgets/ticket_widget.dart';
import 'package:tedx_dtu_app/global/widgets/labelled_widget.dart';
import 'package:tedx_dtu_app/helpers/classes/ui_helper.dart';
import 'package:tedx_dtu_app/helpers/constants/constants.dart';
import 'package:http/http.dart' as http;

class ClaimTicketWidget extends StatefulWidget {
  const ClaimTicketWidget({
    Key? key,
    required this.razorpayOrderID,
    required this.eventName,
    required this.venue,
    required this.date,
    required this.noOfTickets,
    required this.ticketID,
    required this.claimedTickets,
  }) : super(key: key);
  final String razorpayOrderID;
  final String eventName;
  final String venue;

  final DateTime date;
  final int noOfTickets;
  final String ticketID;
  final int claimedTickets;
  @override
  State<ClaimTicketWidget> createState() => _ClaimTicketWidgetState();
}

class _ClaimTicketWidgetState extends State<ClaimTicketWidget> {
  int _noOfTicketsToUpdate = 0;

  @override
  Widget build(BuildContext context) {
    bool haveAllBeenUsed = widget.claimedTickets == widget.noOfTickets;
    final labelStyle = Theme.of(context).textTheme.headline5?.copyWith(
          color: Theme.of(context).primaryColor,
          fontSize: 18,
        );
    return AlertDialog(
      title: Text('User\'s Ticket'),
      content: Column(
        // mainAxisAlignment: ,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customLabelledWidget(
              labelStyle: labelStyle,
              label: 'TicketID',
              value: widget.ticketID),
          customLabelledWidget(
            labelStyle: labelStyle,
            label: 'Claimed Tickets',
            value: widget.claimedTickets.toString(),
          ),
          customLabelledWidget(
            labelStyle: labelStyle,
            label: 'Total Tickets',
            value: widget.noOfTickets.toString(),
          ),
          customLabelledWidget(
              labelStyle: labelStyle,
              label: 'Event Name',
              value: widget.eventName),
          customLabelledWidget(
              labelStyle: labelStyle, label: 'Venue', value: widget.venue),
          customLabelledWidget(
            labelStyle: labelStyle,
            label: 'Date',
            value: DateFormat.yMMMMd().format(widget.date),
          ),
          if (!haveAllBeenUsed)
            SingleChildScrollView(
              child: Row(
                children: List.generate(
                  widget.noOfTickets - widget.claimedTickets,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        _noOfTicketsToUpdate = index + 1;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          (index + 1).toString(),
                          style:
                              Theme.of(context).textTheme.headline5?.copyWith(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          if (!haveAllBeenUsed)
            ElevatedButton(
              onPressed: () {
                claimTickets();
              },
              child: Text('Claim $_noOfTicketsToUpdate Tickets '),
            ),
          if (haveAllBeenUsed)
            Text(
              'All tickets have been claimed',
              style: Theme.of(context).textTheme.headline5?.copyWith(
                  color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }

  Future<void> claimTickets() async {
    final url = Uri.parse(nodeServerBaseUrl + '/api/tickets/claim-tickets');
    final body = {
      'ticketID': widget.ticketID,
      'toClaim': _noOfTicketsToUpdate.toString(),
    };
    final authToken =
        await FirebaseAuth.instance.currentUser?.getIdToken() ?? "null";
    try {
      final response = await http.post(url, body: body, headers: {
        'authorization': authToken,
      });
      if (response.statusCode == 200) {
        UIHelper.showSuccessDialog(context, 'Success', 'Tickets claimed');
      } else {
        UIHelper.showErrorDialog(context, 'Error',
            'Something went wrong ${response.body} ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  Widget customLabelledWidget(
      {required String label, required String value, TextStyle? labelStyle}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LabelledWidget(
        labelStyle: labelStyle,
        label: label,
        child: Text(value),
      ),
    );
  }
}
