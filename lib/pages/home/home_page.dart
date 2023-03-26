import 'package:flutter/material.dart';
import 'package:hereis/pages/home/sections/section_background.dart';

import 'sections/section_top/section_top.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return const Scaffold(
        resizeToAvoidBottomInset: false,
        body: SectionBackground(
          children: [
            SectionTop(),
          ],
        ));
  }
}
