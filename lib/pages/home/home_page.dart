import 'package:flutter/material.dart';
import 'package:hereis/pages/home/sections/section_background.dart';
import 'sections/section_list_of_items/section_list_of_items.dart';
import 'sections/section_top/section_top.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool showCEPsFavorites;

  @override
  void initState() {
    showCEPsFavorites = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SectionBackground(
        children: [
          SectionTop(
            showCEPsFavorites: showCEPsFavorites,
            changeFilter: ({required bool value}) {
              setState(() {
                showCEPsFavorites = value;
              });
            },
          ),
          Expanded(
            child: SectionListOfCards(
              showCEPsFavorites: showCEPsFavorites,
            ),
          )
        ],
      ),
    );
  }
}
