import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:tedx_dtu_app/events/widgets/ticket_widget.dart';
import 'package:tedx_dtu_app/global/widgets/labelled_widget.dart';

class UpdateTicketWidget extends StatefulWidget {
  const UpdateTicketWidget({
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
  State<UpdateTicketWidget> createState() => _UpdateTicketWidgetState();
}

class _UpdateTicketWidgetState extends State<UpdateTicketWidget> {
  @override
  Widget build(BuildContext context) {
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
          // TicketWidget(
          //   razorpayOrderID: widget.razorpayOrderID,
          //   eventName: widget.eventName,
          //   venue: widget.venue,
          //   date: widget.date,
          //   noOfTickets: widget.noOfTickets,
          // )

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
        ],
      ),
    );
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
