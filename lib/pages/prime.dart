import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservebite/widget/font_support.dart';

class Prime extends StatefulWidget {
  const Prime({Key? key}) : super(key: key);

  @override
  State<Prime> createState() => _PrimeState();
}

class _PrimeState extends State<Prime> {
  List<Map<String, String>> imageList = [
    {"id": "1", "image_path": 'images/banner1.jpg'},
    {"id": "2", "image_path": 'images/banner2.jpg'},
    {"id": "3", "image_path": 'images/banner3.jpg'},
  ];

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  int selectedPlanIndex = 1;

  final List<Map<String, dynamic>> membershipPlans = [
    {
      "duration": "1 Month",
      "description": "Enjoy 1 month of premium access.",
      "benefits": [
        "Guaranteed 25% off at premium restaurants",
        "Get 2x reward points and redeem them for free meal ",
        "Entry tickets to Prime-Only restaurant"
      ],
      "price": "550"
    },
    {
      "duration": "12 Months",
      "description": "Enjoy 12 months of premium access.",
      "benefits": [
        "Guaranteed 25% off at premium restaurants",
        "Get 2x reward points and redeem them for free meal ",
        "Entry tickets to Prime-Only restaurant",
        "Joining bonus of 2000 Points"
      ],
      "price": "3550"
    },
    {
      "duration": "3 Months",
      "description": "Enjoy 3 months of premium access.",
      "benefits": [
        "Guaranteed 25% off at premium restaurants",
        "Get 2x reward points and redeem them for free meal ",
        "Entry tickets to Prime-Only restaurant",
        "Joining bonus of 500 Points"
      ],
      "price": "1095"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      print(currentIndex);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        child: CarouselSlider(
                          items: imageList
                              .map(
                                (item) => Image.asset(
                                  item['image_path']!,
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                ),
                              )
                              .toList(),
                          carouselController: carouselController,
                          options: CarouselOptions(
                            scrollPhysics: const BouncingScrollPhysics(),
                            autoPlay: false,
                            aspectRatio: 2,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imageList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () =>
                              carouselController.animateToPage(entry.key),
                          child: Container(
                            width: currentIndex == entry.key ? 17 : 7,
                            height: 7.0,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 3.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: currentIndex == entry.key
                                  ? Colors.red
                                  : Color.fromARGB(255, 62, 63, 63),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Select a Membership Plan',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              membershipPlans[selectedPlanIndex]['description'] as String,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Price: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '\₹${membershipPlans[selectedPlanIndex]['price']}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.lineThrough,
                    color: Color.fromARGB(255, 249, 102, 92),
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  ' \₹${(int.parse(membershipPlans[selectedPlanIndex]['price']) * 0.45).toStringAsFixed(2)}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: membershipPlans.asMap().entries.map((entry) {
                  int index = entry.key;
                  Map<String, dynamic> plan = entry.value;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPlanIndex = index;
                      });
                    },
                    child: Container(
                      height: 100.0,
                      width: MediaQuery.of(context).size.width * 0.4,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: index == selectedPlanIndex
                              ? Colors.red
                              : Colors.grey,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              plan['duration'] as String,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Price: \₹${plan['price']}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(left: 10, top: 10),
                children: [
                  Text(
                    'Benefits',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ...(membershipPlans[selectedPlanIndex]['benefits']
                          as List<String>)
                      .map(
                        (benefit) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            benefit,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
