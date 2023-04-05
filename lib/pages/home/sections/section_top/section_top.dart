import 'package:flutter/material.dart';
import 'package:hereis/pages/home/sections/section_top/widget/text_field_widget.dart';
import 'package:hereis/repositoreis/cep_repository.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'widget/card_of_filter.dart';

class SectionTop extends StatelessWidget {
  final Function({required bool value}) changeFilter;
  final bool showCEPIsFavorites;
  const SectionTop(
      {Key? key, required this.changeFilter, required this.showCEPIsFavorites})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 64, bottom: 32),
                child: TextFieldWidget(),
              ),
              Wrap(
                spacing: 12,
                children: [
                  CardOfFilter(
                    label: 'Histórico',
                    selected: !showCEPIsFavorites,
                    onPressed: () => changeFilter(
                      value: false,
                    ),
                  ),
                  CardOfFilter(
                    label: 'Favoritos',
                    selected: showCEPIsFavorites,
                    onPressed: () => changeFilter(
                      value: true,
                    ),
                  ),
                ],
              ),
              if (Provider.of<CepRepository>(context).loading)
                const Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),
              if (Provider.of<CepRepository>(context).historyOfCEPs.isEmpty &&
                  !showCEPIsFavorites &&
                  !Provider.of<CepRepository>(context).loading)
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  height: 150,
                  width: width,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white)),
                  child: Column(
                    children: [
                      Expanded(
                        child: LottieBuilder.network(
                            height: 150,
                            width: 150,
                            filterQuality: FilterQuality.high,
                            "https://assets8.lottiefiles.com/private_files/lf30_k6fpeaa5.json"),
                      ),
                      const Text(
                        "Nenhum CEP encontrado, faça pesquisas.",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              if (Provider.of<CepRepository>(context).cepsIsFavorite.isEmpty &&
                  showCEPIsFavorites &&
                  !Provider.of<CepRepository>(context).loading)
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  height: 150,
                  width: width,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white)),
                  child: Column(
                    children: [
                      Expanded(
                        child: LottieBuilder.network(
                            height: 150,
                            width: 150,
                            filterQuality: FilterQuality.high,
                            "https://assets8.lottiefiles.com/private_files/lf30_k6fpeaa5.json"),
                      ),
                      const Text(
                        "Adicione CEPs aos favoritos através do histórico.",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
