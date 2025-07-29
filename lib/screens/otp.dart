import 'package:account_login/auth/phone_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseAuth _firebase = FirebaseAuth.instance;

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String verificationId = '';
  int? otp;
  bool otpSent = false;
  void initState() {
    super.initState();
    _startTimer();
    _sendOTP();
  }

  void _startTimer() {
    print("Starting timer for OTP");
    _timer = Timer.periodic(Duration(seconds: 150), (timer) {
      setState(() {
        _start = 0;
      });
    });
  }

  void _sendOTP() {
    print("Sending OTP to user's email");
    _firebase.verifyPhoneNumber(
      phoneNumber: phoneNumber,
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
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("Code auto-retrieval timeout");
      },
    );
  }

  void _verifyOTP(String otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );
  }

  Timer? _timer;
  int _start = 30;
  @override
  Widget build(BuildContext context) {
    Widget otpField;
    if (otpSent) {
      otpField = Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter the OTP sent to your email',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'OTP',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle OTP verification
              },
              child: Text('Verify OTP'),
            ),
          ],
        ),
      );
    } else {
      otpField = Center(
        child: Text('Sending OTP...', style: TextStyle(fontSize: 18)),
      );
    }
    print("Building OTP Screen");
    return Scaffold(
      appBar: AppBar(title: Text('OTP Verification')),
      body: otpField,
    );
  }
}
