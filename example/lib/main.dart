import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:etisalat/etisalat.dart';
import 'package:etisalat_example/model/PaymentCardRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  runApp(const MyApp());
}

const platform = MethodChannel('com.etisalat');

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  bool displayWebview = false;
  String webPortalUrl = '';
  String transactionId = '';
  bool paymentStatusDisplay = false;
  String paymentStatus = '';

  @override
  void initState() {
    super.initState();
    // initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await Etisalat.platformVersion ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      paymentRegistration();
                    },
                    child: const Text('Registration')),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      paymenFinalisationApi();
                    },
                    child: const Text('Finalization')),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      paymentAuthorisation();
                    },
                    child: const Text('Authorisation')),
                const SizedBox(
                  height: 10,
                ),
                paymentStatusDisplay
                    ? Center(
                        child: Text('Payment Status : $paymentStatus\n'),
                      )
                    : Container(),
              ],
            ),
            Visibility(
              visible: displayWebview,
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                    url: Uri.parse(
                      webPortalUrl,
                    ),
                    headers: {
                      'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: Uint8List.fromList(
                        utf8.encode("TransactionID=$transactionId")),
                    method: "POST"),
                shouldOverrideUrlLoading: (controller, navigationAction) async {
                  final uri = navigationAction.request.url;
                  debugPrint('navigation url --- ${uri!.path}');
                  return NavigationActionPolicy.CANCEL;
                },
                onWebViewCreated: (InAppWebViewController controller) {},
                onLoadStart: (InAppWebViewController? controller, Uri? url) {
                  if (url!.path == "/callbackURL") {
                    displayWebview = false;
                    setState(() {});
                    paymenFinalisationApi();
                  }
                  debugPrint('on Load Start --- ${url.path}');
                },
                onLoadStop:
                    (InAppWebViewController? controller, Uri? url) async {
                  debugPrint('on Load Stop --- ${url!.path}');
                },
                onProgressChanged:
                    (InAppWebViewController controller, int progress) {},
              ),
            )
          ],
        ),
      ),
    );
  }

  void paymentRegistration() async {
    debugPrint('on click of registartion');
    var data = <String, dynamic>{
      'Currency': "AED",
      'ReturnPath': "https://localhost/callbackURL",
      'TransactionHint': "CPT:Y;VCC:Y;",
      'OrderID': "7210055701315195",
      "Store": "0000",
      "Terminal": "0000",
      "Channel": "Web",
      'Amount': "10.00",
      'Customer': 'Demo Merchant',
      'OrderName': "Paybill",
      'UserName': 'Demo_fY9c',
      'Password': 'Comtrust@20182018'
    };
    try {
      var result = await platform.invokeMethod('registration', data);
      Map<dynamic, dynamic> response;
      if (result != null) {
        if (result is List) {
          debugPrint('ios response --- ${result}');
          List<dynamic> res = result as List;
          response = res.elementAt(0);
        } else
          response = result as Map;

        if (response.containsKey(2) && response[2] != null) {
          webPortalUrl = response[2] as String;
          paymentStatusDisplay = false;
          paymentStatus = '';
          displayWebview = true;
          transactionId = response[4] as String;
          setState(() {});
        }
      }
      debugPrint('Result: $result ');
      return result;
    } on PlatformException catch (e) {
      debugPrint("Error: '${e.message}'.");
      return null;
    }
  }

  void paymentAuthorisation() async {
    PaymentCardRequest paymentCardRequest = new PaymentCardRequest();
    paymentCardRequest.authorization = new Authorization();
    paymentCardRequest.authorization!.cardNumber = "4111111111111111";
    paymentCardRequest.authorization!.expiryMonth = "11";
    paymentCardRequest.authorization!.expiryYear = "2020";
    paymentCardRequest.authorization!.verifyCode = "123";
    paymentCardRequest.authorization!.orderName = "Pinger-NBAD";
    paymentCardRequest.authorization!.orderID = "990000227113719";
    paymentCardRequest.authorization!.amount = "100";
    //Manual data
    paymentCardRequest.authorization!.customer = 'THOUGHT FACTORY';
    paymentCardRequest.authorization!.language = "en";
    paymentCardRequest.authorization!.transactionHint = "CPT:Y;";
    paymentCardRequest.authorization!.channel = "Phone";
    paymentCardRequest.authorization!.currency = "AED";
    paymentCardRequest.authorization!.userName = "Demo_fY9c";
    paymentCardRequest.authorization!.password = "Comtrust@20182018";
    try {
      var result = await platform.invokeMethod(
          'authorisation', paymentCardRequest.toJson());
      if (result != null) {
        if (result is Map<int, String>) {
          Map<int, String> response = result;
          if (response.length == 2) {
            for (int i = 0; i < response.length; i++) {
              print(">>> " + response.values.elementAt(i));
            }
          }
        }
      }
      debugPrint('Result: $result ');
      return result;
    } on PlatformException catch (e) {
      debugPrint("Error: '${e.message}'.");
      return null;
    }
  }

  void paymenFinalisationApi() async {
    Map<String, dynamic> data = {};
    data['TransactionID'] = transactionId;
    data['Customer'] = 'Demo Merchant';
    data['UserName'] = "Demo_fY9c";
    data['Password'] = "Comtrust@20182018";
    try {
      var result = await platform.invokeMethod('finalization', data);
      Map<dynamic, dynamic> response;
      if (result != null) {
        if (result is List) {
          debugPrint('ios response --- ${result}');
          List<dynamic> res = result as List;
          response = res.elementAt(0);
        } else
          response = result as Map;
        if (response.containsKey(2) && response[2] != null) {
          paymentStatusDisplay = true;
          paymentStatus = response[2] as String;
          setState(() {});
        }
      }
    } on PlatformException catch (e) {
      debugPrint("Error: '${e.message}'.");
      return null;
    }
  }
}
