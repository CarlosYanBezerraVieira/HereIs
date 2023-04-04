import 'package:flutter/material.dart';
import 'package:hereis/models/cep_model.dart';

import 'item_card.dart';

class ListOfCepsIsFavorite extends StatelessWidget {
  final Key keyList;
  final List<CepModel> ceps;
  final Function({required bool isFavorite, required CepModel cep})
      changeIsSaveOfCEP;
  const ListOfCepsIsFavorite(
      {super.key,
      required this.ceps,
      required this.changeIsSaveOfCEP,
      required this.keyList});

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      initialItemCount: ceps.length,
      key: keyList,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index, animation) {
        if (ceps.isNotEmpty) {
          return SizeTransition(
            key: UniqueKey(),
            sizeFactor: animation,
            child: ItemCard(
              model: ceps[index],
              onChanged: (value) {
                changeIsSaveOfCEP(
                  cep: ceps[index],
                  isFavorite: true,
                );
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
