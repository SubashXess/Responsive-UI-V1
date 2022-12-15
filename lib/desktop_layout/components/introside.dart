import 'package:flutter/material.dart';

class IntroSide extends StatelessWidget {
  const IntroSide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.deepOrange.shade400,
        ),
      ),
    );
  }
}
