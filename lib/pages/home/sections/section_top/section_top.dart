import 'package:flutter/material.dart';
import 'package:hereis/pages/home/sections/section_top/widget/text_field_widget.dart';
import 'package:hereis/repositoreis/cep_repository.dart';
import 'package:provider/provider.dart';

import 'widget/card_of_filter.dart';

class SectionTop extends StatelessWidget {
  final Function({required bool value}) changeFilter;
  final bool showCEPIsSave;
  const SectionTop(
      {Key? key, required this.changeFilter, required this.showCEPIsSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 64, bottom: 32),
                child: TextFieldWidget(
                  callback: (model) {
                    Provider.of<CepRepository>(context, listen: false)
                      ..saveCEP(cep: model)
                      ..addCEP(cep: model);
                  },
                ),
              ),
              Wrap(
                spacing: 12,
                children: [
                  CardOfFilter(
                    label: 'Todos',
                    selected: !showCEPIsSave,
                    onPressed: () => changeFilter(
                      value: false,
                    ),
                  ),
                  CardOfFilter(
                    label: 'Salvos',
                    selected: showCEPIsSave,
                    onPressed: () => changeFilter(
                      value: true,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
