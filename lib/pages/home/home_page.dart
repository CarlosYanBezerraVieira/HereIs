import 'package:flutter/material.dart';
import 'package:hereis/pages/home/sections/section_background.dart';
import 'package:hereis/repositoreis/cep_repository.dart';
import 'package:provider/provider.dart';

import '../../models/cep_model.dart';
import 'sections/section_list_of_items/section_list_of_items.dart';
import 'sections/section_top/section_top.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool showCEPIsSave;

  @override
  void initState() {
    showCEPIsSave = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Consumer<CepRepository>(
        builder: (context, cepRepository, child) {
          return SectionBackground(
            children: [
              SectionTop(
                showCEPIsSave: showCEPIsSave,
                changeFilter: ({required bool value}) {
                  setState(() {
                    showCEPIsSave = value;
                  });
                },
              ),
              Expanded(
                  child: SectionListOfCards(
                ceps: filterCEPs(
                  ceps: cepRepository.ceps,
                ),
              )),
            ],
          );
        },
      ),
    );
  }

  List<CepModel> filterCEPs({required List<CepModel> ceps}) {
    return ceps
        .where(
          (element) => element.isSave == showCEPIsSave,
        )
        .toList();
  }
}
