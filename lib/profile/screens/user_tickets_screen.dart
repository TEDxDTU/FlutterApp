import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/widgets/ticket_widget.dart';
import 'package:tedx_dtu_app/global/screens/future_screen_template.dart';
import 'package:tedx_dtu_app/home/screens/no_bottombar_screen.dart';
import '../../global/widgets/tedx_loading_spinner.dart';
import '../../helpers/constants/constants.dart';
import 'package:http/http.dart' as http;

class UserTicketsScreen extends StatelessWidget {
  const UserTicketsScreen({Key? key}) : super(key: key);

  Future<List<Map<String, dynamic>>> sendReq() async {
    final userToken = await FirebaseAuth.instance.currentUser!.getIdToken();
    final url = "$nodeServerBaseUrl/api/user/tickets";
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': userToken,
      },
    );
    // print(response.body);
    final List<dynamic> tickets = jsonDecode(response.body);
    // print(tickets[0].runtimeType);
    final List<Map<String, dynamic>> ticketMap = List.from(tickets);
    // print(tickets.toString() + DateTime.now().toString());

    return ticketMap;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: sendReq(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: TedxLoadingSpinner(),
          );
        }
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: SelectableText(
                'Error: ${snapshot.error}',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }
        // print(snapshot.data);
        final data = snapshot.data as List<Map<String, dynamic>>;
        if (data.isEmpty) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Tickets"),
            ),
            body: const Center(
              child: SelectableText(
                'No tickets found',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text("Tickets"),
          ),
          body: SingleChildScrollView(
            child: Column(
              // itemBuilder: (ctx, idx) {
              //   final event = data[idx]['event'];
              //   if (event != null) {
              //     return Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: TicketWidget(
              //         date: DateTime.parse(event['dateTime']),
              //         eventName: event['title'],
              //         venue: event['venue'],
              //         noOfTickets: data[idx]['noOfTickets'],
              //         razorpayOrderID: data[idx]['razorpayOrderID'],
              //       ),
              //     );
              //   } else {
              //     print('event for ticket is null');
              //     return SizedBox();
              //   }
              // },
              // itemCount: data.length,
              children: data.map((e) {
                final event = e['event'];
                if (event != null) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TicketWidget(
                      date: DateTime.parse(event['dateTime']),
                      eventName: event['title'],
                      venue: event['venue'],
                      noOfTickets: e['noOfTickets'],
                      razorpayOrderID: e['razorpayOrderID'],
                    ),
                  );
                } else {
                  print('event for ticket is null');
                  return SizedBox();
                }
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
