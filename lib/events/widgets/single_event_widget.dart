import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tedx_dtu_app/events/screens/event_info_screen.dart';

import '../../global/widgets/custom_image_widget.dart';

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
  final int? ticketPrice;
  Widget buildCircularDotRow(String txt1, String txt2, {double siz = 14}) {
    return Row(
      children: [
        Flexible(
          child: Text(
            txt1,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: siz),
          ),
        ),
        const SizedBox(width: 7),
        Container(
          width: 3,
          height: 5,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 7),
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildCircularDotRow(
              eventName,
              eventDate.year.toString(),
              siz: 20,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Hero(
                    tag: imageUrl,
                    child: CustomImageWidget(
                      url: imageUrl,
                      height: 85,
                      width: 105,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: Text(
                    eventDescription,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        eventVenue,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        DateFormat('hh:mm a | dd MMM,yyyy').format(eventDate),
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 30.0,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(EventInfoScreen.routeName, arguments: {
                        'eventId': eventId,
                        'eventType': isUpcoming ? 'upcoming' : 'past',
                      });
                    },
                    child: Text(
                      isUpcoming ? '₹$ticketPrice' : 'Info',
                      style: const TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      primary: isUpcoming ? Colors.red : Colors.black,
                    ),
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
