import 'package:flutter/material.dart';
import 'package:hereis/models/cep_model.dart';
import 'package:provider/provider.dart';

import '../../../../repositoreis/cep_repository.dart';
import 'widget/item_card.dart';

class SectionListOfCards extends StatelessWidget {
  final bool showCEPsFavorites;
  const SectionListOfCards({Key? key, required this.showCEPsFavorites})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CepRepository>(
      builder: (context, cepRepository, child) {
        final cepsFilter = filterCEPs(ceps: cepRepository.ceps);
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                ...List.generate(
                  cepsFilter.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ItemCard(
                      model: cepsFilter[index],
                      onChanged: (value) {
                        cepRepository.saveContact(
                          isFavorite: value ?? false,
                          cep: cepsFilter[index],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<CepModel> filterCEPs({required List<CepModel> ceps}) {
    return ceps
        .where(
          (element) => element.isFavorite == showCEPsFavorites,
        )
        .toList();
  }
}
