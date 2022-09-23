import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:tedx_dtu_app/global/providers/auth.dart';

import '../../helpers/constants/constants.dart';

void handlePaymentSuccess(PaymentSuccessResponse response) {
  print("Payment succeeded");
  print(response);
}

void handlePaymentError(PaymentFailureResponse response) {
  print("Payment failed");
  print(response);
}

Future<String> getOrderId(
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
        "user": {
          "_id": uid,
        }
      },
    ),
  );

  return (jsonDecode(resp.body)['orderID']);
}
