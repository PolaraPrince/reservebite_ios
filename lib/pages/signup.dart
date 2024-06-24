import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reservebite/pages/login.dart';
import 'package:reservebite/pages/otp.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  DateTime? _birthday;
  DateTime? _anniversary;
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Back"),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
                child: Image.asset(
              "images/Sign up.png",
              height: 250,
              width: double.infinity,
            )),
            Text(
              "Almost Done!",
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'sf-pro'),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Enter the fields below to create an account\n                        +918923456789",
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'sf-pro'),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
              child: Container(
                height: 50.0,
                width: double.infinity,
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "Full Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: Container(
                height: 50.0,
                width: double.infinity,
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: Container(
                height: 50.0,
                width: double.infinity,
                child: TextField(
                  readOnly: true,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.cake),
                    labelText: "Birthday",
                    suffixIcon: Icon(Icons.calendar_today),
                    hintText:
                        "${_birthday == null ? '' : _birthday.toString().split(' ')[0]}",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: _birthday ?? DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null) {
                      setState(() {
                        _birthday = picked;
                      });
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 73.0),
                  child: Text(
                    "Have a referral code?",
                    style: TextStyle(fontSize: 18.0, fontFamily: 'sf-pro'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Container(
                    width: double.infinity,
                    child: CheckboxListTile(
                      title: Text(
                        "Get booking confirmation & reminders on Whatsapp",
                        style: TextStyle(fontFamily: 'sf-pro'),
                      ),
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OtpPage()),
                    );
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: const Color.fromARGB(221, 255, 255, 255),
                        fontSize: 16.0,
                        fontFamily: 'sf-pro'),
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.disabled)) {
                          return Color.fromARGB(255, 235, 133, 31)
                              .withOpacity(0.5);
                        }
                        return Color.fromARGB(255, 235, 133, 31);
                      },
                    ),
                    padding: WidgetStateProperty.all(
                      EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 2.7,
                        vertical: 15,
                      ),
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
