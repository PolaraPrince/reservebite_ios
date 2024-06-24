import 'package:flutter/material.dart';
import 'package:reservebite/pages/otp.dart';
import 'package:reservebite/pages/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _controller = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_validateInput);
  }

  void _validateInput() {
    setState(() {
      _isButtonEnabled = _controller.text.length == 10;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Column(
                    children: [
                      Container(
                        child: Image.asset(
                          "images/Fingerprint.png",
                          height: 300,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Text(
                        "Enter your mobile number",
                        style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'sf-pro'),
                      ),
                      SizedBox(height: 10.0),
                      Center(
                        child: Text(
                          "Mobile number helps us to reach you for\n    your booking and for awesome offers",
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'sf-pro'),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10.0),
                        child: Container(
                          height: 50.0,
                          width: double.infinity,
                          child: TextField(
                            controller: _controller,
                            textAlignVertical: TextAlignVertical.center,
                            style: TextStyle(fontSize: 16),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                child: Icon(Icons.call),
                              ),
                              prefixText: "+91 ",
                              prefixStyle: TextStyle(fontSize: 16),
                              hintText: "Enter your mobile number",
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 12.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7.0),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 235, 133, 31),
                                ),
                              ),
                            ),
                            cursorColor: Color.fromARGB(255, 235, 133, 31),
                          ),
                        ),
                      ),
                      SizedBox(height: 25.0),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isButtonEnabled
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Signup()),
                          );
                        }
                      : null,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Get OTP",
                      style: TextStyle(
                        color: const Color.fromARGB(221, 255, 255, 255),
                        fontSize: 16.0,
                        fontFamily: 'sf-pro',
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Color.fromARGB(255, 235, 133, 31)
                              .withOpacity(0.5);
                        }
                        return Color.fromARGB(255, 235, 133, 31);
                      },
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 2.7,
                        vertical: 15,
                      ),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
