import 'package:account_login/auth/phone_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _firebase = FirebaseAuth.instance;

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late String verificationId;
  bool otpSent = true;
  TextEditingController _otpController = TextEditingController();
  Timer? _timer;
  int _start = 60;
  List<TextEditingController> _otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  List<FocusNode> _otpFocusNode = List.generate(6, (_) => FocusNode());
  String getOTP() {
    return _otpControllers.map((controller) => controller.text).join();
  }

  void initState() {
    super.initState();
    _sendOTP();
    _startTimer();
  }

  void _startTimer() {
    print("Starting timer for OTP resend");
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start > 0) {
        setState(() {
          _start--;
        });
      } else {
        _timer?.cancel();
        setState(() {});
      }
    });
  }

  void _sendOTP() {
    _firebase.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        print("Verification completed: ${credential.smsCode}");
        await _firebase.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print("Verification failed: ${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        print("Code sent to user's email: $verificationId");
        setState(() {
          otpSent = true;
        });
        this.verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("Code auto-retrieval timeout");
      },
    );
  }

  void _verifyOTP(String otp) async {
    PhoneAuthCredential credential = await PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );
    try {
      await _firebase.signInWithCredential(credential);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('OTP verified successfully')));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error verifying OTP: $e')));
    }
  }

  void dispose() {
    _timer?.cancel();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget otpField;
    if (otpSent) {
      otpField = Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Phone Verification"),
            Text(
              'Enter the verification code, send to your phone number +921234567890',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Row(
              children: List.generate(6, (index) {
                return Container(
                  width: 40,
                  height: 40,
                  child: TextFormField(
                    focusNode: _otpFocusNode[index],
                    controller: _otpControllers[index],
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    maxLength: 1,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        if (index < 5) {
                          FocusScope.of(
                            context,
                          ).requestFocus(_otpFocusNode[index + 1]);
                        } else {
                          FocusScope.of(context).unfocus();
                        }
                      } else {
                        if (index > 0) {
                          FocusScope.of(
                            context,
                          ).requestFocus(_otpFocusNode[index - 1]);
                        }
                      }
                    },
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _verifyOTP(_otpController.text);
              },
              child: Text('Verify OTP'),
            ),
            TextButton(
              onPressed: () {
                if (_start == 0) {
                  _sendOTP();
                  _start = 60;
                  _startTimer();
                }
              },

              child: Text(
                'Resend OTP (${_start}s)',
                style: TextStyle(color: _start > 0 ? Colors.grey : Colors.blue),
              ),
            ),
          ],
        ),
      );
    } else {
      otpField = Center(
        child: Text('Sending OTP...', style: TextStyle(fontSize: 18)),
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text('OTP')),
      body: otpField,
    );
  }
}
