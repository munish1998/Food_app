import 'package:flutter/material.dart';

class IntroScreen3 extends StatelessWidget {
  const IntroScreen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/image3.png',
              fit: BoxFit.cover, width: size.width, height: size.height),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 140,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.elliptical(180, 90),
                  topLeft: Radius.elliptical(100, 50),
                ),
                color: Color.fromARGB(255, 195, 90, 52),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: size.height * 0.5,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.elliptical(180, 180),
                  topLeft: Radius.elliptical(100, 100),
                  bottomLeft: Radius.circular(45),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 65, left: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 12,
                      width: 25,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Start Journey',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const Text(
                      'With Fashions',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'In publishing and graph design lorem',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    const Text(
                      'ipsum is a placeholder text commonly used',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    const SizedBox(height: 45),
                    Container(
                      height: 12,
                      width: 25,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 226, 70, 166)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
