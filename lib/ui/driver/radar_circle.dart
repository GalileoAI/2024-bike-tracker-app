import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadarCircle extends StatelessWidget {
  final int radius;

  const RadarCircle({
    super.key,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: radius * 2,
        height: radius * 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(radius.toDouble()),
          ),
          border: Border.all(
            color: Colors.black45,
            width: 2,
          ),
        ),
      ),
    );
  }
}
