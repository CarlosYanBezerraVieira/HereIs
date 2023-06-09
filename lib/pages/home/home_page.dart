import 'package:flutter/material.dart';
import 'package:hereis/pages/home/sections/section_background.dart';
import 'package:provider/provider.dart';
import '../../repositoreis/cep_repository.dart';
import 'sections/section_list_of_items/section_list_of_items.dart';
import 'sections/section_top/section_top.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Consumer<CepRepository>(builder: (context, cepRepository, child) {
        return SectionBackground(
          children: [
            SectionTop(
              showCEPIsFavorites: cepRepository.showCEPIsFavorites,
              changeFilter: ({required bool value}) {
                cepRepository.setShowCEPIsFavorites(value: value);
              },
            ),
            Expanded(
              child: SectionListOfCards(
                showCEPIsFavorites: cepRepository.showCEPIsFavorites,
              ),
            )
          ],
        );
      }),
    );
  }
}
