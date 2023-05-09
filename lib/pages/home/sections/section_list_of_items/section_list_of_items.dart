import 'package:flutter/material.dart';
import 'package:hereis/pages/home/sections/section_list_of_items/widget/list_of_ceps_history.dart';
import 'package:provider/provider.dart';
import '../../../../repositoreis/cep_repository.dart';
import 'widget/list_of_ceps_is_favorite.dart';

class SectionListOfCards extends StatelessWidget {
  final bool showCEPIsFavorites;
  const SectionListOfCards({Key? key, required this.showCEPIsFavorites})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CepRepository>(
      builder: (context, cepRepository, child) {
        return Visibility(
          visible: showCEPIsFavorites,
          replacement: ListOfCepsHistory(
            deleteItem: (cep) {
              cepRepository.deleteCEP(cep: cep);
            },
            ceps: cepRepository.historyOfCEPs,
            changeIsSaveOfCEP: cepRepository.changeIsSaveOfCEP,
            keyList: cepRepository.keyHistoryOfCEPs,
          ),
          child: ListOfCepsIsFavorite(
            deleteItem: (cep) {
              cepRepository.deleteCEP(cep: cep);
            },
            ceps: cepRepository.cepsIsFavorite,
            changeIsSaveOfCEP: cepRepository.changeIsSaveOfCEP,
            keyList: cepRepository.keyIsFavorite,
          ),
        );
      },
    );
  }
}
