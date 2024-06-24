import 'package:flutter/material.dart';
import 'package:reservebite/pages/login.dart';
import "package:reservebite/widget/content_model.dart";

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          contents[i].image,
                          height: 283.4,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Text(
                          contents[i].title,
                          style: TextStyle(
                            color: Color(0xff6D3805),
                            fontSize: 24,
                            fontFamily: 'sf-pro',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          contents[i].desc,
                          style: TextStyle(
                            color: Color.fromARGB(148, 109, 55, 5),
                            fontSize: 16,
                            fontFamily: 'sf-pro',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (currentIndex == contents.length - 1) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  } else {
                    _controller.nextPage(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.bounceIn);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 40.0, bottom: 30.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(18)),
                    height: 60,
                    width: 60,
                    child: Center(
                      child: Text(
                        ">",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
