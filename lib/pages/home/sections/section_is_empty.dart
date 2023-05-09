import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../core/gifs/gifs.dart';
import '../../../repositoreis/cep_repository.dart';

class SectionIsEmpty extends StatelessWidget {
  const SectionIsEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final repo = Provider.of<CepRepository>(context);
    return FutureBuilder(
        future: showCardNotfound(repository: repo),
        builder: (context, asyncSnapshot) {
          final widget = asyncSnapshot.data;
          return widget ?? const SizedBox.shrink();
        });
  }

  Widget cardNotFound({
    required String description,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      height: 150,
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white)),
      child: Column(
        children: [
          Expanded(
            child: LottieBuilder.asset(
              height: 150,
              width: 150,
              filterQuality: FilterQuality.high,
              Gifs.notFound,
            ),
          ),
          Text(
            description,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Future<Widget> showCardNotfound({required CepRepository repository}) async {
    {
      if (!repository.loading) {
        if (repository.showCEPIsFavorites &&
            repository.cepsIsFavorite.isEmpty) {
          return cardNotFound(
              description: "Adicione CEPs aos favoritos através do histórico.");
        } else if (!repository.showCEPIsFavorites &&
            repository.historyOfCEPs.isEmpty) {
          return cardNotFound(
            description: "Nenhum CEP encontrado, faça pesquisas.",
          );
        }
      }

      return const SizedBox.shrink();
    }
  }
}
