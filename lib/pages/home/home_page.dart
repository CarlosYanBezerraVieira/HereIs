import 'package:flutter/material.dart';
import 'package:hereis/core/routes/enums/type_of_ceps_enum.dart';
import 'package:hereis/pages/home/sections/section_background.dart';
import 'package:hereis/repositoreis/cep_repository.dart';
import 'package:provider/provider.dart';

import 'sections/section_list_of_items/section_list_of_items.dart';
import 'sections/section_top/section_top.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                  selectedFilter: TypesOfCepsEnum.all,
                  changeFilter: ({required TypesOfCepsEnum value}) {},
                ),
                Expanded(
                    child: SectionListOfItems(
                  ceps: cepRepository.ceps,
                )),
              ],
            );
          },
        ));
  }
}
