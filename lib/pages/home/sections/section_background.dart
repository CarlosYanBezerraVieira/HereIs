import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import '../../../core/gifs/gifs.dart';
import 'section_is_empty.dart';

class SectionBackground extends StatelessWidget {
  final List<Widget> children;
  const SectionBackground({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          child: LottieBuilder.asset(
            height: height / 2,
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
            Gifs.map,
          ),
        ),
        Container(
          height: height / 2,
          decoration: const BoxDecoration(
            color: Color(0xff1B1E23),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        Positioned(
          left: 30,
          right: 30,
          bottom: (height / 2) + 30,
          child: const SectionIsEmpty(),
        ),
        Column(
          children: children,
        ),
      ],
    );
  }
}
