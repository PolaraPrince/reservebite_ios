import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reservebite/pages/bottomnav.dart';
import 'package:reservebite/pages/home.dart';
import 'package:reservebite/pages/login.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  List<String> _otp = List.filled(4, '');
  List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  bool _isButtonEnabled = false;

  @override
  void dispose() {
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 20.0, right: 20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Text(
                  "Verify OTP!",
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'sf-pro'),
                ),
                Text(
                  "Enter the OTP sent to +91 1234567890",
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'sf-pro'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  child: Text(
                    "Change number?",
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                        fontFamily: 'sf-pro'),
                  ),
                ),
                SizedBox(height: 50.0),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < 4; i++)
                        SizedBox(
                          width: 50.0,
                          child: TextField(
                            focusNode: _focusNodes[i],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 120, 175, 53),
                                  width: 1.5,
                                ),
                              ),
                            ),
                            cursorColor: Color.fromARGB(255, 120, 175, 53),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                            ],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              if (value.isEmpty && i > 0) {
                                FocusScope.of(context)
                                    .requestFocus(_focusNodes[i - 1]);
                              } else if (value.isNotEmpty && i < 3) {
                                FocusScope.of(context)
                                    .requestFocus(_focusNodes[i + 1]);
                              }
                              setState(() {
                                _otp[i] = value;
                                _isButtonEnabled =
                                    _otp.every((digit) => digit.isNotEmpty);
                              });
                            },
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 30.0),
                Text("Resend OTP",
                    style: TextStyle(
                      fontSize: 16.0,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                    )),
                SizedBox(height: 50.0),
                ElevatedButton(
                  onPressed: _isButtonEnabled
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainWrapper()),
                          );
                        }
                      : null,
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                        color: Color.fromARGB(255, 254, 253, 253),
                        fontFamily: 'sf-pro'),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: _isButtonEnabled
                          ? const Color.fromARGB(255, 38, 37, 37)
                          : Colors.grey,
                      padding:
                          EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
