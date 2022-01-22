import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SingleEventWidget extends StatelessWidget {
  const SingleEventWidget(
      {Key? key,
      required this.eventId,
      required this.eventName,
      required this.eventDate,
      required this.imageUrl,
      required this.eventDescription,
      required this.eventVenue,
      required this.isUpcoming,
      this.ticketPrice})
      : assert(!isUpcoming || ticketPrice != null,
            'Upcoming events must have a ticket price'),
        super(key: key);
  final String eventId;
  final String eventName;
  final DateTime eventDate;
  final String imageUrl;
  final String eventDescription;
  final String eventVenue;
  final bool isUpcoming;
  final double? ticketPrice;
  Widget buildCircularDotRow(String txt1, String txt2, {double siz = 14}) {
    return Row(
      children: [
        Text(
          txt1,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: siz),
        ),
        SizedBox(width: 7),
        Container(
          width: 3,
          height: 5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 7),
        Text(
          txt2,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: siz),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isUpcoming ? Colors.white : Colors.grey[100],
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildCircularDotRow(
              eventName,
              eventDate.year.toString(),
              siz: 20,
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    imageUrl,
                    height: 85,
                    width: 105,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: Text(
                    eventDescription,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildCircularDotRow(
                  eventVenue,
                  DateFormat('hh:mm a | dd MMM,yyyy').format(DateTime.now()),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    isUpcoming ? '₹$ticketPrice' : 'Info',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    primary: isUpcoming ? Colors.red : Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
