import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reservebite/widget/font_support.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

GlobalKey<NavigatorState> _bookingNavigatorKey = GlobalKey<NavigatorState>();

class _BookingState extends State<Booking> {
  bool _isBookTableSelected = true;
  bool _isWalkInOfferSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(180),
        child: AppBar(
          toolbarHeight: 180,
          automaticallyImplyLeading: false,
          title: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              height: 100,
              width: double.infinity,
              padding: const EdgeInsets.only(left: 10, right: 25, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.discount,
                      size: 40, color: Color.fromARGB(255, 41, 41, 42)),
                  Text(
                    "Dinner voucher of ₹300\nis waiting for you!",
                    style: AppWidget.semiBoldTextFeildStyle(),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 245, 129, 100),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Bookings",
                    style: _isBookTableSelected
                        ? AppWidget.boldTextFeildStyle().copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xffef5c39),
                          )
                        : AppWidget.semiBoldTextFeildStyle(),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isBookTableSelected = false;
                        _isWalkInOfferSelected = true;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Booking(),
                        ),
                      );
                    },
                    child: Text(
                      "Coupons",
                      style: _isWalkInOfferSelected
                          ? AppWidget.boldTextFeildStyle().copyWith(
                              decoration: TextDecoration.underline,
                            )
                          : AppWidget.semiBoldTextFeildStyle(),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
      body: Center(
        child: Text(
          "No upcoming bookings available.",
          style: AppWidget.semiBoldTextFeildStyle(),
        ),
      ),
    );
  }
}
