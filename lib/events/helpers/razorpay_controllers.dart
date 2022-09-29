import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:tedx_dtu_app/global/providers/auth.dart';

import '../../helpers/constants/constants.dart';
import 'package:flutter/material.dart';
import '../../global/providers/globals.dart' as globals;

SnackBar getSnackBar(String message, Color bgColor,
    [SnackBarAction? snackBarAction]) {
  return SnackBar(
    content: Text(message,
        style: const TextStyle(
          color: Colors.white,
        )),
    duration: const Duration(milliseconds: 2000),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    backgroundColor: bgColor,
    action: snackBarAction,
  );
}

void handlePaymentSuccess(PaymentSuccessResponse response) {
  print("Payment succeeded");
  print(response);
  globals.snackbarKey.currentState?.showSnackBar(
    getSnackBar(
      "Payment Succeeded!",
      Colors.green,
      // SnackBarAction(
      //   label: "My Tickets",
      //   textColor: Colors.black,
      //   onPressed: () {},
      // ),
    ),
  );
}

void handlePaymentError(PaymentFailureResponse response) {
  print("Payment failed");
  print(response);
  globals.snackbarKey.currentState?.showSnackBar(
    getSnackBar(
      'Payment Failed, please try again!',
      Colors.red,
    ),
  );
}

Future<Map<String, dynamic>> getOrderDetails(
    int price, int numTickets, String uid, String authToken) async {
  String url = nodeServerBaseUrl + "/api/tickets/generate-order";

  Map<String, String> headers = {
    "Content-Type": "application/json",
    HttpHeaders.authorizationHeader: authToken,
  };

  http.Response resp = await http.post(
    Uri.parse(url),
    headers: headers,
    body: jsonEncode(
      {
        "price": price,
        "numTickets": numTickets,
        "user": jsonEncode({
          "_id": uid,
        }),
      },
    ),
  );
  print(resp.body);
  return (jsonDecode(resp.body));
}
