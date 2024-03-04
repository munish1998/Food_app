import 'package:flutter/material.dart';
import 'package:foods_app/Login_page.dart';
import 'package:foods_app/Screens/Onboarding_Screen/Tutorial_Screen1.dart';
import 'package:foods_app/Screens/Onboarding_Screen/Tutorial_Screen2.dart';
import 'package:foods_app/Screens/Onboarding_Screen/Tutorial_Screen3.dart';
import 'package:foods_app/Screens/Onboarding_Screen/Tutorial_Screen1.dart';
import 'package:foods_app/Sign_Up_Page.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  PageController _controller = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              controller: _controller,
              children: const [IntroScreen1(), IntroScreen2(), IntroScreen3()],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildIndicator(0),
                    buildIndicator(1),
                    buildIndicator(2),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.95),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => LoginPage()),
                      );
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 230,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_currentPage < 2) {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      } else {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => LoginPage()),
                        );
                      }
                    },
                    child: Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: _currentPage < 2
                            ? Color.fromARGB(255, 195, 90, 52)
                            : Color.fromARGB(255, 195, 90, 52),
                      ),
                      child: Center(
                        child: Text(
                          _currentPage < 2 ? 'Next' : 'Done',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator(int index) {
    return Container(
      height: 8,
      width: _currentPage == index ? 24 : 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: _currentPage == index
            ? const Color.fromARGB(255, 195, 90, 52)
            : Colors.grey,
      ),
    );
  }
}
