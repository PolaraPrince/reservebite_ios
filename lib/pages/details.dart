import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reservebite/widget/font_support.dart';
import 'package:reservebite/widget/food_items.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  int _numberOfPersons = 1;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(
              primary: Colors.deepOrange,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  String _formatDate(DateTime date) {
    final today = DateTime.now();
    final tomorrow = today.add(const Duration(days: 1));
    if (date.year == today.year &&
        date.month == today.month &&
        date.day == today.day) {
      return 'Today';
    } else if (date.year == tomorrow.year &&
        date.month == tomorrow.month &&
        date.day == tomorrow.day) {
      return 'Tomorrow';
    } else {
      return DateFormat('EEEE, MMM d').format(date);
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(
              primary: Colors.deepOrange,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedTime)
      setState(() {
        _selectedTime = picked;
      });
  }

  String _formatTime(TimeOfDay time) {
    return "${time.hour}:${time.minute < 10 ? '0${time.minute}' : time.minute}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    child: Image.asset(
                      "images/Restaurant2.jpg",
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 25,
                    left: 20,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mayfair Restaurant",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'sf-pro',
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black,
                                  offset: Offset(2.0, 2.0),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Rajouri Garden, New Delhi",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'sf-pro',
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black,
                                  offset: Offset(2.0, 2.0),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "Today 10:30AM - 11:00PM",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'sf-pro',
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black,
                                  offset: Offset(2.0, 2.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () => _selectDate(context),
                            child: Text(
                              _selectedDate == null
                                  ? 'Select date'
                                  : _formatDate(_selectedDate!),
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: 'f-pro',
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 245, 170, 135)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 93, 93, 93),
                                      width: 1),
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => _selectTime(context),
                            child: Text(
                              _selectedTime == null
                                  ? 'Select time'
                                  : MaterialLocalizations.of(context)
                                      .formatTimeOfDay(_selectedTime!,
                                          alwaysUse24HourFormat: false),
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: 'f-pro',
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 245, 170, 135)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 93, 93, 93),
                                      width: 1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            'Number of persons:',
                            style: AppWidget.semiBoldTextFeildStyle(),
                          ),
                          SizedBox(width: 10),
                          DropdownButton<int>(
                            value: _numberOfPersons,
                            dropdownColor: Color.fromARGB(255, 243, 241, 241),
                            items: List.generate(10, (index) => index + 1)
                                .map((e) => DropdownMenuItem<int>(
                                      value: e,
                                      child: Text(
                                        e.toString(),
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (int? newValue) {
                              setState(() {
                                _numberOfPersons = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Menu',
                            style: AppWidget.headlineTextFeildStyle(),
                          ),
                        ],
                      ),
                      ExpansionTile(
                        tilePadding: EdgeInsets.all(0),
                        title: Text(
                          'Italian Dishes',
                          style: AppWidget.semiBoldTextFeildStyle(),
                        ),
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: FoodData.italianDishes.length,
                            itemBuilder: (context, index) {
                              Food dish = FoodData.italianDishes[index];
                              return ListTile(
                                title: Text(
                                  dish.name,
                                  style: AppWidget.semiBoldTextFeildStyle(),
                                ),
                                subtitle: Text(
                                  dish.description,
                                  style: AppWidget.lightTextFeildStyle(),
                                ),
                                trailing: Text(
                                  '\₹${dish.price}',
                                  style: AppWidget.lightTextFeildStyle(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      ExpansionTile(
                        tilePadding: EdgeInsets.all(0),
                        title: Text(
                          'Chinese Dishes',
                          style: AppWidget.semiBoldTextFeildStyle(),
                        ),
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: FoodData.chineseDishes.length,
                            itemBuilder: (context, index) {
                              Food dish = FoodData.chineseDishes[index];
                              return ListTile(
                                title: Text(
                                  dish.name,
                                  style: AppWidget.semiBoldTextFeildStyle(),
                                ),
                                subtitle: Text(
                                  dish.description,
                                  style: AppWidget.lightTextFeildStyle(),
                                ),
                                trailing: Text(
                                  '\₹${dish.price}',
                                  style: AppWidget.lightTextFeildStyle(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      ExpansionTile(
                        tilePadding: EdgeInsets.all(0),
                        title: Text(
                          'South Indian Dishes',
                          style: AppWidget.semiBoldTextFeildStyle(),
                        ),
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: FoodData.southIndianDishes.length,
                            itemBuilder: (context, index) {
                              Food dish = FoodData.southIndianDishes[index];
                              return ListTile(
                                title: Text(
                                  dish.name,
                                  style: AppWidget.semiBoldTextFeildStyle(),
                                ),
                                subtitle: Text(
                                  dish.description,
                                  style: AppWidget.lightTextFeildStyle(),
                                ),
                                trailing: Text(
                                  '\₹${dish.price}',
                                  style: AppWidget.lightTextFeildStyle(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      ExpansionTile(
                        tilePadding: EdgeInsets.all(0),
                        title: Text(
                          'North Indian Dishes',
                          style: AppWidget.semiBoldTextFeildStyle(),
                        ),
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: FoodData.northIndianDishes.length,
                            itemBuilder: (context, index) {
                              Food dish = FoodData.northIndianDishes[index];
                              return ListTile(
                                title: Text(
                                  dish.name,
                                  style: AppWidget.semiBoldTextFeildStyle(),
                                ),
                                subtitle: Text(
                                  dish.description,
                                  style: AppWidget.lightTextFeildStyle(),
                                ),
                                trailing: Text(
                                  '\₹${dish.price}',
                                  style: AppWidget.lightTextFeildStyle(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      ExpansionTile(
                        tilePadding: EdgeInsets.all(0),
                        title: Text(
                          'Multi Cuisine',
                          style: AppWidget.semiBoldTextFeildStyle(),
                        ),
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: FoodData.multiCuisineDishes.length,
                            itemBuilder: (context, index) {
                              Food dish = FoodData.multiCuisineDishes[index];
                              return ListTile(
                                title: Text(
                                  dish.name,
                                  style: AppWidget.semiBoldTextFeildStyle(),
                                ),
                                subtitle: Text(
                                  dish.description,
                                  style: AppWidget.lightTextFeildStyle(),
                                ),
                                trailing: Text(
                                  '\₹${dish.price}',
                                  style: AppWidget.lightTextFeildStyle(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 238, 237, 237),
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.payment),
                  label: Text(
                    "Pay Bill",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'sf-pro'),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 71, 70, 70),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  )),
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.table_chart),
                  label: Text(
                    "Book Table",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'sf-pro'),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffef5c39),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
