import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:tedx_dtu_app/events/screens/event_booking_screen.dart';
import 'package:tedx_dtu_app/home/screens/no_bottombar_screen.dart';

/// Displays the information about a particular event.
class EventInfoWidget extends StatelessWidget {
  const EventInfoWidget({
    Key? key,
    required this.eventVenue,
    required this.dateTime,
    required this.eventDescription,
    required this.eventType,
    required this.eventId,
    required this.marginVal,
    required this.eventTitle,
    required this.eventPrice,
  }) : super(key: key);
  final String eventVenue;
  final DateTime dateTime;
  final String eventDescription;
  final String eventType;
  final String eventId;

  /// The margins to put around the Widget.
  final double marginVal;
  final String eventTitle;
  final int eventPrice;

  Widget _createListTile(IconData icon, String txt) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            // size: 30,
          ),
          const SizedBox(
            width: 25,
          ),
          Flexible(
            child: Text(
              txt,
              style: const TextStyle(
                color: Colors.white,
                // fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: height,
      padding: const EdgeInsets.all(13),
      margin: EdgeInsets.all(marginVal),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _createListTile(Icons.location_on, eventVenue),
          _createListTile(
            Icons.calendar_today,
            DateFormat('dd MMMM, yyyy').format(
              dateTime,
            ),
          ),
          _createListTile(
            Icons.access_time_rounded,
            DateFormat('hh:mm a').format(dateTime),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: BorderRadius.circular(12),
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const Text(
                    'About',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    eventDescription,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          if (eventType == 'upcoming')
            ElevatedButton(
              onPressed: () {
                // TODO: EventBookingScreen push here
                Navigator.of(context).pushNamed(NoBottomBarScreen.routeName,
                    arguments: <String, Object>{
                      'child': const EventBookingScreen(),
                      'eventDescription': eventDescription,
                      'venue': eventVenue,
                      'dateTime': dateTime,
                      'eventTitle': eventTitle,
                      'eventPrice': eventPrice,
                      'eventId': eventId,
                    });
              },
              child: const Text(
                'BOOK NOW',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                primary: Colors.red[600],
                minimumSize: const Size.fromHeight(50),
              ),
            ),
        ],
      ),
    );
  }
}
