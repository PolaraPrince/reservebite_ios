import 'package:flutter/material.dart';
// import 'package:qrscan/qrscan.dart' as scanner;
import 'package:reservebite/widget/font_support.dart';

class PayBills extends StatefulWidget {
  const PayBills({super.key});

  @override
  State<PayBills> createState() => _PayBillsState();
}

class _PayBillsState extends State<PayBills> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pay Bills'),
      ),
      body: Container(
        color: Colors.deepOrangeAccent,
        height: MediaQuery.of(context).size.height / 2,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Search the restaurant to pay',
              style: AppWidget.semiBoldTextFeildStyle(),
            ),
            Text(
              'Get EXTRA 25% OFF upto ₹1000.',
              style: AppWidget.smallBoldTextFeildStyle(),
            ),
            Text(
              'Exciting bank offers',
              style: AppWidget.smallBoldTextFeildStyle(),
            ),
            Center(
              child: SizedBox(
                width: double.infinity,
                height: 80.0,
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          textStyle: MaterialStateProperty.all(
                            TextStyle(
                              fontSize: 18,
                              fontFamily: 'sf-pro',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.black,
                          )),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QRViewExample()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search),
                          SizedBox(width: 8),
                          Text('Search Restaurant To Pay'),
                        ],
                      )),
                ),
              ),
            ),
            Text('-or-'),
            Center(
              child: SizedBox(
                width: double.infinity,
                height: 80.0,
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          textStyle: MaterialStateProperty.all(
                            TextStyle(
                              fontSize: 18,
                              fontFamily: 'sf-pro',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.black,
                          )),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QRViewExample()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.qr_code_scanner),
                          SizedBox(width: 8),
                          Text('Scan QR Code'),
                        ],
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class QRViewExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  String? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Center(
              child: ElevatedButton(
                onPressed: () async {
                  // String? scanResult = await scanner.scan();
                  setState(() {
                    // result = scanResult;
                  });
                },
                child: Text('Start QR scan'),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text('Scan Result: $result')
                  : Text('Scan a code'),
            ),
          )
        ],
      ),
    );
  }
}
