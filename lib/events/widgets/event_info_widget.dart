import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventInfoWidget extends StatelessWidget {
  const EventInfoWidget({
    Key? key,
    required this.eventVenue,
    required this.dateTime,
    required this.eventDescription,
    required this.marginVal,
  }) : super(key: key);
  final String eventVenue;
  final DateTime dateTime;
  final String eventDescription;
  final double marginVal;

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
          SizedBox(
            width: 25,
          ),
          Text(
            txt,
            style: TextStyle(
              color: Colors.white,
              // fontSize: 17,
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
      padding: EdgeInsets.all(13),
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
            DateFormat('hh:mm a').format(DateTime.now()),
          ),
          SizedBox(
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
                  Text(
                    'About',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    eventDescription,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'BOOK NOW',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              primary: Colors.red[600],
              minimumSize: Size.fromHeight(50),
            ),
          ),
        ],
      ),
    );
  }
}
