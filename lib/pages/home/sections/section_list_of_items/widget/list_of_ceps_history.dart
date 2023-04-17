import 'package:flutter/material.dart';
import 'package:hereis/models/cep_model.dart';
import 'package:hereis/repositoreis/cep_repository.dart';
import 'package:provider/provider.dart';

import 'item_card.dart';

class ListOfCepsHistory extends StatefulWidget {
  final Key keyList;
  final List<CepModel> ceps;
  final Function({required bool isFavorite, required CepModel cep})
      changeIsSaveOfCEP;
  const ListOfCepsHistory(
      {super.key,
      required this.ceps,
      required this.changeIsSaveOfCEP,
      required this.keyList});

  @override
  State<ListOfCepsHistory> createState() => _ListOfCepsHistoryState();
}

class _ListOfCepsHistoryState extends State<ListOfCepsHistory> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CepRepository>(context, listen: false).populate();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      initialItemCount: widget.ceps.length,
      key: widget.keyList,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index, animation) {
        if (widget.ceps.isNotEmpty) {
          return SlideTransition(
            position: animation.drive(
                Tween(begin: const Offset(0, 1), end: const Offset(0, 0))),
            child: FadeTransition(
                opacity: animation,
                child: SizeTransition(
                    key: UniqueKey(),
                    sizeFactor: animation,
                    child: ItemCard(
                      model: widget.ceps[index],
                      onChanged: (value) {
                        widget.changeIsSaveOfCEP(
                          cep: widget.ceps[index],
                          isFavorite: false,
                        );
                      },
                    ))),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
