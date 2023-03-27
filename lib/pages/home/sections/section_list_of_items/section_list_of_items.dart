import 'package:flutter/material.dart';
import 'package:hereis/models/cep_model.dart';

import 'item_card.dart';

class SectionListOfCards extends StatelessWidget {
  final List<CepModel> ceps;
  const SectionListOfCards({Key? key, required this.ceps}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            ...List.generate(
              ceps.length,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ItemCard(model: ceps[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
