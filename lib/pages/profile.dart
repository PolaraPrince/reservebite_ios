import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reservebite/widget/font_support.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

GlobalKey<NavigatorState> _profileNavigatorKey = GlobalKey<NavigatorState>();

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: double.infinity,
            height: 270,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 14, 14),
                Color.fromARGB(255, 253, 114, 8),
              ],
              begin: Alignment.topLeft,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Color.fromARGB(255, 233, 233, 233),
                  child: Icon(
                    Icons.person,
                    size: 70,
                    color: const Color.fromARGB(255, 91, 90, 90),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'John Dope',
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontFamily: 'sf-pro',
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '+918956472359',
                  style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontFamily: 'sf-pro'),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                top: 10,
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 10.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Positioned(
                    top: -90,
                    left: 20,
                    child: Card(
                      color: Color.fromARGB(255, 251, 210, 172),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              'ReserveBite',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'sf-pro',
                                  fontWeight: FontWeight.w700),
                            ),
                            Text('PRIME',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'sf-pro',
                                    fontWeight: FontWeight.bold)),
                            Text('Get Prime',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'sf-pro',
                                    color: Colors.lightBlue,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -90,
                    right: 20,
                    child: Card(
                      color: Color.fromARGB(255, 217, 246, 236),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text('200',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'sf-pro',
                                    fontWeight: FontWeight.w700)),
                            Text('ReservePoints',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'sf-pro',
                                )),
                            Text('Redeem',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'sf-pro',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.lightBlue)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Icon(Icons.beach_access_outlined),
                    SizedBox(width: 10),
                    Text("Booking", style: AppWidget.lightTextFeildStyle())
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Icon(Icons.receipt_outlined),
                    SizedBox(width: 10),
                    Text("Transaction", style: AppWidget.lightTextFeildStyle())
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Icon(Icons.card_giftcard_outlined),
                    SizedBox(width: 10),
                    Text("Cupons", style: AppWidget.lightTextFeildStyle())
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Icon(Icons.ios_share_outlined),
                    SizedBox(width: 10),
                    Text("Refer and Earn",
                        style: AppWidget.lightTextFeildStyle())
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey),
                    bottom: BorderSide(color: Colors.grey),
                  ),
                ),
                child: ExpansionTile(
                  title: Text("ReserveRewards",
                      style: AppWidget.semiBoldTextFeildStyle()),
                  children: [
                    ListTile(
                      leading: Icon(Icons.history_toggle_off),
                      title: Text("ReservePoints History",
                          style: AppWidget.lightTextFeildStyle()),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.receipt_rounded),
                      title: Text("Redeem ReservePoints",
                          style: AppWidget.lightTextFeildStyle()),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.card_giftcard_outlined),
                      title: Text("Rewards & Coupons",
                          style: AppWidget.lightTextFeildStyle()),
                      onTap: () {},
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey),
                  ),
                ),
                child: ExpansionTile(
                  title: Text("Activities",
                      style: AppWidget.semiBoldTextFeildStyle()),
                  children: [
                    ListTile(
                      leading: Icon(Icons.favorite_border),
                      title: Text("Favorites",
                          style: AppWidget.lightTextFeildStyle()),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.reviews_outlined),
                      title: Text("Review / Ratings",
                          style: AppWidget.lightTextFeildStyle()),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.upload_sharp),
                      title: Text("Uploaded Photos",
                          style: AppWidget.lightTextFeildStyle()),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.rate_review_outlined),
                      title: Text("Rate us on the app store",
                          style: AppWidget.lightTextFeildStyle()),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey),
                  ),
                ),
                child: ExpansionTile(
                  title:
                      Text("Help", style: AppWidget.semiBoldTextFeildStyle()),
                  children: [
                    ListTile(
                      leading: Icon(Icons.info_outline),
                      title:
                          Text("About", style: AppWidget.lightTextFeildStyle()),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.privacy_tip_outlined),
                      title: Text("Privacy Policy",
                          style: AppWidget.lightTextFeildStyle()),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.verified_user_outlined),
                      title: Text("Terms / Conditions",
                          style: AppWidget.lightTextFeildStyle()),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.feed_outlined),
                      title: Text("Feedback",
                          style: AppWidget.lightTextFeildStyle()),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.call),
                      title: Text("Call us",
                          style: AppWidget.lightTextFeildStyle()),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 125,
                    height: 60,
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color(0xffef5c39),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color(0xffef5c39),
                          ),
                        ),
                        hintText: "Logout",
                        hintStyle: TextStyle(
                          color: Color(0xffef5c39),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'sf-pro',
                        ),
                        prefixIcon:
                            Icon(Icons.logout, color: Color(0xffef5c39)),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    width: 125,
                    height: 60,
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color(0xffef5c39),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color(0xffef5c39),
                          ),
                        ),
                        hintText: "Chat",
                        hintStyle: TextStyle(
                          color: Color(0xffef5c39),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'sf-pro',
                        ),
                        prefixIcon: Icon(
                          Icons.chat_outlined,
                          color: Color(0xffef5c39),
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
