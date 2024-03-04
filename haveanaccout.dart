import 'package:flutter/material.dart';

class HaveAccountOrNot extends StatelessWidget {
  final String title, subTitle;
  final Function? onTap;
  HaveAccountOrNot(
      {required this.onTap, required this.title, required this.subTitle});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        GestureDetector(
          //  onTap: ,
          child: Text(
            subTitle,
            style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).primaryColor,
            ),
          ),
        )
      ],
    );
  }
}
