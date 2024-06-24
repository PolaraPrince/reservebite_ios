import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:reservebite/pages/bottomnav.dart';
import 'package:reservebite/pages/details.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reservebite/pages/prime.dart';
import 'package:reservebite/pages/search.dart';
import 'package:reservebite/pages/walkin.dart';
import 'package:reservebite/widget/font_support.dart';
import 'package:reservebite/widget/food_items.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

GlobalKey<NavigatorState> _homeNavigatorKey = GlobalKey<NavigatorState>();

class _HomeState extends State<Home> {
  List imageList = [
    {"id": 1, "image_path": 'images/banner1.jpg'},
    {"id": 2, "image_path": 'images/banner2.jpg'},
    {"id": 3, "image_path": 'images/banner3.jpg'},
  ];
  List<Map<String, String>> recommended = [
    {
      'path': 'images/dimand1.jpg',
      'text': 'Delicious fruit dessert on festive tablegr',
    },
    {
      'path': 'images/dimand2.jpg',
      'text': 'Delicious mediterranean salad',
    },
  ];
  final List<Map<String, String>> offers = [
    {
      'path': 'images/HDFC offer.png',
    },
    {
      'path': 'images/ICICI offer.png',
    },
    {
      'path': 'images/Axis offer.png',
    },
    {
      'path': 'images/cashback offer.png',
    },
  ];
  final List<Map<String, String>> pick = [
    {
      'path': 'images/booktable.jpg',
      'text': 'Book a Table Up to 50% Off',
    },
    {
      'path': 'images/member.jpg',
      'text': 'Prime guranteed 25-50% off',
    },
    {
      'path': 'images/walkin.jpg',
      'text': 'Walk-In Up to 40% off',
    },
  ];
  final List<Map<String, String>> popular = [
    {
      'path': 'images/50%off.jpg',
      'text': 'Uptp 50% off\n view All >',
    },
    {
      'path': 'images/fastfood.jpg',
      'text': 'Fast Food\n View All >',
    },
    {
      'path': 'images/1+1buffet.jpg',
      'text': '1+1 on\n Buffet\n View All >',
    },
    {
      'path': 'images/20%off.jpg',
      'text': 'Upto 20%\n OFF Deals\n View All >',
    },
  ];
  final List<Map<String, String>> buffets = [
    {
      'path': 'images/50%off.jpg',
      'name': "South Indian + North Indian",
      'text': '10% off on this combo',
    },
    {
      'path': 'images/fastfood.jpg',
      'name': "Chinese + North Indian",
      'text': '20% off on this combo',
    },
    {
      'path': 'images/1+1buffet.jpg',
      'name': "Italian + Chinese",
      'text': '30% off on this combo',
    },
    {
      'path': 'images/20%off.jpg',
      'name': "Multi-Cuisine + Desserts",
      'text': '35% off on this combo',
    },
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  bool _showAll = false;
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
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(children: [
                Icon(Icons.location_on, color: Color(0xffef5c39)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Location",
                      style: AppWidget.smallBoldTextFeildStyle(),
                    ),
                    Row(
                      children: [
                        Text("Rajouri Garden",
                            style: AppWidget.semiBoldTextFeildStyle()),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xffef5c39)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: Row(
                    children: [
                      Icon(FontAwesomeIcons.crown, color: Colors.white),
                      SizedBox(width: 8),
                      Text("Prime"),
                    ],
                  ),
                ),
              ]),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  child: TextField(
                    readOnly: true,
                    cursorColor: Color(0xffef5c39),
                    decoration: InputDecoration(
                      hintText: "Search for restaurants,cuisines or a dish",
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Book A Table",
                      style: _isBookTableSelected
                          ? TextStyle(
                                  fontFamily: 'sf-pro',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19)
                              .copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xffef5c39),
                            )
                          : AppWidget.semiBoldTextFeildStyle(),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isBookTableSelected = true;
                          _isWalkInOfferSelected = false;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Walkin(),
                          ),
                        );
                      },
                      child: Text(
                        "Walk-in Offer",
                        style: _isWalkInOfferSelected
                            ? TextStyle(
                                    fontFamily: 'sf-pro',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)
                                .copyWith(
                                decoration: TextDecoration.underline,
                              )
                            : AppWidget.semiBoldTextFeildStyle(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
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
                                item['image_path'],
                                fit: BoxFit.fill,
                                width: double.infinity,
                              ),
                            )
                            .toList(),
                        carouselController: carouselController,
                        options: CarouselOptions(
                          scrollPhysics: const BouncingScrollPhysics(),
                          autoPlay: true,
                          aspectRatio: 3,
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
                                  : Color.fromARGB(255, 62, 63, 63)),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hi There, What's Your Pick?",
                  style: AppWidget.semiBoldTextFeildStyle(),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(pick.length, (index) {
                  return Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(pick[index]['path']!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  backgroundBlendMode: BlendMode.multiply,
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 0, 0, 0)
                                          .withOpacity(.2),
                                      Color.fromARGB(0, 0, 0, 0),
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    pick[index]['text']!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'sf-pro',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (index != pick.length - 1) SizedBox(width: 10),
                    ],
                  );
                }),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Highly Recommended",
                  style: AppWidget.semiBoldTextFeildStyle(),
                ),
                Text(
                  "view all",
                  style: TextStyle(
                      color: Color(0xffef5c39),
                      fontSize: 14,
                      fontFamily: 'sf-pro',
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(recommended.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Details()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 200,
                              width: 200,
                              child: Image.asset(
                                recommended[index]['path']!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  backgroundBlendMode: BlendMode.darken,
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 0, 0, 0)
                                          .withOpacity(.8),
                                      Color.fromARGB(32, 17, 16, 16),
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  recommended[index]['text']!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: 'sf-pro',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dine Anytime!",
                  style: AppWidget.semiBoldTextFeildStyle(),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Menu(
                        foodItems: FoodData.breakfastDishes,
                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Color.fromARGB(255, 250, 250, 250),
                      child: Image.asset("images/breakfast.png"),
                    ),
                    Text(
                      "Breakfast",
                      style: TextStyle(
                          fontFamily: 'sf-pro',
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Menu(
                        foodItems: FoodData.lunchDishes,
                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Color.fromARGB(255, 250, 250, 250),
                      child: Image.asset("images/lunch-time.png"),
                    ),
                    Text(
                      "Lunch",
                      style: TextStyle(
                          fontFamily: 'sf-pro',
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Menu(
                        foodItems: FoodData.dinnerDishes,
                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Color.fromARGB(255, 250, 250, 250),
                      child: Image.asset("images/dinner.png"),
                    ),
                    Text(
                      "Dinner",
                      style: TextStyle(
                          fontFamily: 'sf-pro',
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Menu(
                        foodItems: FoodData.fastFoodDishes,
                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Color.fromARGB(255, 250, 250, 250),
                      child: Image.asset("images/burger.png"),
                    ),
                    Text(
                      "Fast Food",
                      style: TextStyle(
                          fontFamily: 'sf-pro',
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Payment Offers",
                  style: AppWidget.semiBoldTextFeildStyle(),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(offers.length, (index) {
                  return Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 140,
                            width: 180,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(offers[index]['path']!),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (index != offers.length - 1) SizedBox(width: 10),
                    ],
                  );
                }),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular Collections",
                  style: AppWidget.semiBoldTextFeildStyle(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(popular.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Details()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 180,
                              width: 150,
                              child: Image.asset(
                                popular[index]['path']!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  backgroundBlendMode: BlendMode.hardLight,
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(212, 0, 0, 0)
                                          .withOpacity(.7),
                                      Color.fromARGB(0, 46, 46, 46),
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                  ),
                                ),
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  popular[index]['text']!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontFamily: 'sf-pro',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Container(
              width: double.infinity,
              height: 120.0,
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Image.asset("images/HDFC offer.png", fit: BoxFit.fill),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "What's Your Mood?",
                  style: AppWidget.semiBoldTextFeildStyle(),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Menu(
                            foodItems: FoodData.southIndianDishes,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundColor: Color.fromARGB(255, 250, 250, 250),
                          child: Image.asset(
                            "images/southindian.jpg",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Text(
                          "South Indian",
                          style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: 'sf-pro',
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Menu(
                            foodItems: FoodData.italianDishes,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundColor: Color.fromARGB(255, 250, 250, 250),
                          child: Image.asset("images/italian.jpg"),
                        ),
                        Text(
                          "Italian",
                          style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: 'sf-pro',
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Menu(
                            foodItems: FoodData.northIndianDishes,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundColor: Color.fromARGB(255, 250, 250, 250),
                          child: Image.asset("images/north.jpg"),
                        ),
                        Text(
                          "North Indian",
                          style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: 'sf-pro',
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Menu(
                            foodItems: FoodData.panAsiaDishes,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundColor: Color.fromARGB(255, 250, 250, 250),
                          child: Image.asset("images/panasia.jpg"),
                        ),
                        Text(
                          "Pan Asia",
                          style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: 'sf-pro',
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Menu(
                            foodItems: FoodData.multiCuisineDishes,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundColor: Color.fromARGB(255, 250, 250, 250),
                          child: Image.asset("images/multi.jpg",
                              fit: BoxFit.cover),
                        ),
                        Text(
                          "Multi Cuisine",
                          style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: 'sf-pro',
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Menu(
                            foodItems: FoodData.chineseDishes,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundColor: Color.fromARGB(255, 250, 250, 250),
                          child: Image.asset("images/chinese_food.jpg"),
                        ),
                        Text(
                          "Chinese",
                          style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: 'sf-pro',
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Best Buffets",
                  style: AppWidget.semiBoldTextFeildStyle(),
                ),
                SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _showAll ? buffets.length : 3,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(buffets[index]['path']!),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                buffets[index]['name']!,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontFamily: 'sf-pro',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Discount: ${buffets[index]['text']}",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xffef5c39),
                                    fontFamily: 'sf-pro',
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Visibility(
                  visible: buffets.length > 3,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _showAll = !_showAll;
                      });
                    },
                    child: Center(
                      child: Text(
                        _showAll ? "Hide" : "View All",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xffef5c39),
                          fontFamily: 'sf-pro',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 80),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
