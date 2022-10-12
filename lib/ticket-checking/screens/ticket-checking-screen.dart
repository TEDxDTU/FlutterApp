import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:tedx_dtu_app/helpers/constants/constants.dart';

import 'package:http/http.dart' as http;
import 'package:tedx_dtu_app/ticket-checking/widgets/claim_ticket_widget.dart';

import '../../helpers/classes/ui_helper.dart';

class TicketScheckingScreen extends StatefulWidget {
  const TicketScheckingScreen({Key? key}) : super(key: key);
  static const routeName = '/ticket-checking-screen';
  @override
  State<TicketScheckingScreen> createState() => _TicketScheckingScreenState();
}

class _TicketScheckingScreenState extends State<TicketScheckingScreen> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (result != null)
                    Text(
                        'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  else
                    const Text('Scan a code'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.toggleFlash();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getFlashStatus(),
                              builder: (context, snapshot) {
                                return Text('Flash: ${snapshot.data}');
                              },
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.flipCamera();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getCameraInfo(),
                              builder: (context, snapshot) {
                                if (snapshot.data != null) {
                                  return Text(
                                      'Camera facing ${describeEnum(snapshot.data!)}');
                                } else {
                                  return const Text('loading');
                                }
                              },
                            )),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.pauseCamera();
                          },
                          child: const Text('pause',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.resumeCamera();
                          },
                          child: const Text('resume',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await fetchAndVerifyTicket();
                            },
                            child: Icon(Icons.refresh)),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 80,
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  Future<void> fetchAndVerifyTicket() async {
    final url = Uri.parse(
        nodeServerBaseUrl + "/api/tickets/verify-ticket/${result!.code}");
    // showDialog(
    //     context: context,
    //     builder: (_) {
    //       return Text('blah');
    //     });
    final authToken =
        (await FirebaseAuth.instance.currentUser?.getIdToken()) ?? "null";
    final response = await http.get(url, headers: {
      "authorization": authToken,
    });
    if (response.statusCode == 401) {
      UIHelper.showErrorDialog(
        context,
        'Unauthorized',
        'You aren\'t authorized to verify tickets',
      );
      print(response.body);
      return;
    } else if (response.statusCode == 404) {
      UIHelper.showErrorDialog(
        context,
        'No Ticket Found',
        'A ticket matching this QR could not be found',
      );
      return;
    } else if (response.statusCode == 500) {
      UIHelper.showErrorDialog(
        context,
        'Server Error',
        'There was an error on the server',
      );
      return;
    }
    print("hello here ");
    print(response.statusCode);
    print(response.body);
    final e = json.decode(response.body);
    final event = e['event'];
    await showDialog(
        context: context,
        builder: (_) {
          return ClaimTicketWidget(
            date: DateTime.parse(event['dateTime']),
            eventName: event['title'],
            venue: event['venue'],
            noOfTickets: e['noOfTickets'],
            razorpayOrderID: e['razorpayOrderID'],
            ticketID: e['_id'],
            claimedTickets: e['claimedTickets'],
          );
        });
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
      controller.pauseCamera();
    });
    controller.scannedDataStream.listen((scanData) {
      // debugger(when: true, message: "FUCKING WORK");
      print(scanData.code ?? "" + DateTime.now().toString());
      setState(() {
        result = scanData;
      });
      controller.pauseCamera();
      fetchAndVerifyTicket();
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
