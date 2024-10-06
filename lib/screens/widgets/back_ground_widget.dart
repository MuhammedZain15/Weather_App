import 'dart:ui';

import 'package:flutter/material.dart';

class BackGroundWidget extends StatelessWidget {
  const BackGroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional(3, -0.3),
          child: Container(
            height: 300,
            width: 300,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.deepPurple),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(-3, -0.3),
          child: Container(
            height: 300,
            width: 300,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.deepPurple),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0, -1.3),
          child: Container(
            height: 300,
            width: 600,
            decoration: BoxDecoration(color: Color(0xFFFFAB40)),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}
