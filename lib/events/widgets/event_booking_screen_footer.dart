import 'dart:convert';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'package:tedx_dtu_app/events/widgets/selectable_box.dart';
import 'package:tedx_dtu_app/global/providers/auth.dart';

import '../../helpers/widgets/expanded_row.dart';
import '../helpers/concave_corners_with_radius_clip.dart';
import '../helpers/dotted_seperator.dart';
import '../helpers/razorpay_controllers.dart' as razorpay_controller;

class EventBookingScreenFooter extends StatefulWidget {
  const EventBookingScreenFooter({
    Key? key,
    required this.venue,
    required this.ticketPrice,
    required this.eventName,
    required this.eventDesc,
    required this.eventId,
  }) : super(key: key);
  final String venue;
  final int ticketPrice;
  final String eventName;
  final String eventDesc;
  final String eventId;
  @override
  State<EventBookingScreenFooter> createState() =>
      _EventBookingScreenFooterState();
}

class _EventBookingScreenFooterState extends State<EventBookingScreenFooter> {
  int numberOfTickets = 1;

  final _razorpay = Razorpay();

  @override
  void initState() {
    _razorpay.on(
      Razorpay.EVENT_PAYMENT_SUCCESS,
      razorpay_controller.handlePaymentSuccess,
    );
    _razorpay.on(
      Razorpay.EVENT_PAYMENT_ERROR,
      razorpay_controller.handlePaymentError,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = max(750, mediaQuery.size.height);
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipPath(
          clipper: const ConcaveCornersWithRadiusClip(
            topRight: true,
            topLeft: true,
          ),
          child: Container(
            width: mediaQuery.size.width * 0.9,
            height: height * 0.55,
            color: const Color(0xff303030),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TODO: Align image to the bottom
                Padding(
                  padding: const EdgeInsets.only(
                    top: 24.0,
                    left: 24,
                    right: 24,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          widget.venue,
                          maxLines: 3,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 12,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // height: height * 0.45 * 0.25,
                  padding: const EdgeInsets.only(
                    top: 16.0,
                    bottom: 8.0,
                    left: 24,
                    right: 24,
                  ),
                  child: ExpandedRow(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    flexes: const [8, 2],
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              'How many tickets?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          FittedBox(
                            child: Row(
                              children: List.generate(8, (index) {
                                return SelectableBox(
                                  name: '${index + 1}',
                                  color: (index + 1 == numberOfTickets)
                                      ? const Color(0xFFE62B1E)
                                      : const Color(0xFF5A5A5A),
                                  onTap: () {
                                    setState(() {
                                      numberOfTickets = index + 1;
                                    });
                                  },
                                );
                              }, growable: false),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(left: 8),
                        child: Image.asset(
                          'assets/event_booking/$numberOfTickets.png',
                          height: 60,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  margin: const EdgeInsets.only(top: 8),
                  color: const Color(0xFF404040),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Ticket Price',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                _priceTextSpan(context, 22),
                                const TextSpan(
                                  text: ' x ',
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 16,
                                  ),
                                ),
                                TextSpan(
                                  text: numberOfTickets.toString(),
                                  style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 24.0,
                              ),
                              child: Divider(
                                thickness: 2,
                              ),
                            ),
                          ),
                          RichText(
                            text: _priceTextSpan(context, 22),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (ctx) {
                              return const AlertDialog(
                                title: Text('Cancellation Policy'),
                                content: Text('Bla bla bla'),
                              );
                            },
                          );
                        },
                        child: Text(
                          'Cancellation Policy',
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          children: [
                            Text(
                              'Total Payable Amount',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24.0,
                                ),
                                child: Divider(
                                  thickness: 2,
                                ),
                              ),
                            ),
                            RichText(
                              text: _priceTextSpan(context, null),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(mediaQuery.size.width * 0.9 * 0.9, 40),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                    ),
                    child: Text(
                      "Pay ${widget.ticketPrice * numberOfTickets}",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    onPressed: () async {
                      //TODO: Integrate RazorPay here
                      var user =
                          Provider.of<Auth>(context, listen: false).user!;
                      String uid = user.uid;
                      String authToken = await user.auth;
                      print("authToken");
                      Map<String, dynamic> data =
                          await razorpay_controller.getOrderDetails(
                        widget.ticketPrice,
                        numberOfTickets,
                        uid,
                        authToken,
                      );
                      String orderId = data['orderID'];
                      print(orderId);
                      var options = {
                        'key': 'rzp_live_7EvvqC4Y8cW21k',
                        'currency': data['currency'],
                        'amount': data['amount'].toString(),
                        'order_id': orderId,
                        'notes': {
                          '_id': widget.eventId,
                          'firebaseID': FirebaseAuth.instance.currentUser!.uid
                        },
                        'name': "Ticket Booking",
                        'numTickets': numberOfTickets,
                        'description': widget.eventName,
                        'prefill': {
                          'name': user.name,
                          'email': user.email,
                        }
                      };
                      _razorpay.open(options);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: SizedBox(
            width: mediaQuery.size.width * 0.9 - 24,
            child: const DottedSeparator(),
          ),
        ),
      ],
    );
  }

  TextSpan _priceTextSpan(BuildContext context, double? fontSize) {
    return TextSpan(
      children: [
        const TextSpan(text: '₹'),
        TextSpan(
          text: (widget.ticketPrice * numberOfTickets).toString(),
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: fontSize,
              ),
        ),
      ],
    );
  }
}
