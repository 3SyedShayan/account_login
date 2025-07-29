import 'package:account_login/screens/login.dart';
import 'package:account_login/widgets/arc_painter.dart';
import 'package:account_login/widgets/container.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  Widget onboardContainer(int b1, int b2, int b3) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ContainerBox(color: b1),
        SizedBox(width: 8),
        ContainerBox(color: b2),
        SizedBox(width: 8),
        ContainerBox(color: b3),
      ],
    );
  }

  int slide = 1;
  int b1 = 1, b2 = 0, b3 = 0;

  String image = 'assets/images/1.jpg';
  void onBoardChange() {
    if (slide == 1) {
      image = 'assets/images/1.jpg';
      setState(() {
        b1 = 1;
        b2 = 0;
        b3 = 0;
        slide = 1;
      });
    } else if (slide == 2) {
      image = 'assets/images/2.jpg';
      setState(() {
        b1 = 0;
        b2 = 1;
        b3 = 0;
        slide = 2;
      });
    } else if (slide == 3) {
      image = 'assets/images/3.jpg';
      setState(() {
        b1 = 0;
        b2 = 0;
        b3 = 1;
        slide = 3;
      });
    }
    print("Slide Number is $slide");
  }

  @override
  Widget build(BuildContext context) {
    Widget onboardingAction = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            slide = 3;
            onBoardChange();
          },
          child: Text('Skip'),
        ),
        TextButton.icon(
          label: Text('Next'),
          onPressed: () {
            slide = slide + 1;
            onBoardChange();
          },
          icon: Icon(Icons.arrow_forward),
          iconAlignment: IconAlignment.end,
        ),
      ],
    );

    if (slide == 3) {
      onboardingAction = CustomPaint(
        size: Size(50, 50),
        painter: ArcPainter(),
        child: Container(
          margin: EdgeInsets.all(15),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            icon: Icon(Icons.arrow_forward),

            color: Color.fromARGB(255, 248, 120, 1),
          ),
        ),
      );
    }
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            children: [
              SizedBox(height: 400),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(25.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 248, 120, 1),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'We serve\nincomparable\ndelicacies',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "All the best restaurants with their top menu waiting for you, they can't wait for your order!!",
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 15),
                      onboardContainer(b1, b2, b3),
                      SizedBox(height: 70),
                      onboardingAction,
                    ],
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
