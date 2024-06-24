import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservebite/widget/font_support.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        leading: Icon(Icons.arrow_back_ios, color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              child: TextField(
                cursorColor: Color(0xffef5c39),
                decoration: InputDecoration(
                  hintText: "Search for restaurants,cuisines or a dish",
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Color(0xffef5c39)),
                  ),
                ),
              ),
            ),
            Text(
              "Recently viewed by you",
              style: AppWidget.semiBoldTextFeildStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
