import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventInfo extends StatelessWidget {
  EventInfo(
      {required this.eventVenue,
      required this.dateTime,
      required this.eventDescription,
      required this.height,required this.paddingVal});
  final String eventVenue;
  final DateTime dateTime;
  final String eventDescription;
  final double height;
  final double paddingVal;

  Widget createListTile(IconData icon, String txt) {
    return ListTile(
      tileColor: Colors.grey[850],
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        txt,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Container(
      height: height,
      padding: EdgeInsets.all(paddingVal),
      child: Card(
        color: Colors.grey[850],
        child: Padding(
          padding: EdgeInsets.only(
              left: mediaQuery.size.width * 0.05,
              right: mediaQuery.size.width * 0.05,
              top: mediaQuery.size.height * 0.15,
              bottom: mediaQuery.size.height * 0.07),
          child: Column(
            children: [
              createListTile(Icons.location_on, eventVenue),
              createListTile(
                Icons.calendar_today,
                DateFormat('dd MMM,yyyy').format(
                  DateTime.now(),
                ),
              ),
              createListTile(
                Icons.access_time_rounded,
                DateFormat('hh:mm a').format(DateTime.now()),
              ),
              SizedBox(height: mediaQuery.size.height*0.025,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text(
                        'ABOUT',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        eventDescription,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: mediaQuery.size.height * 0.12,
              ),
              SizedBox(
                height: mediaQuery.size.height * 0.055,
                width: mediaQuery.size.width * 0.9,
                child: ElevatedButton(
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
