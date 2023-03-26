import 'package:flutter/material.dart';
import 'package:hereis/pages/home/sections/section_top/widget/text_field_widget.dart';

import 'widget/card_of_filter.dart';

class SectionTop extends StatelessWidget {
  const SectionTop({Key? key}) : super(key: key);

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
              const Padding(
                padding: EdgeInsets.only(top: 64, bottom: 32),
                child: TextFieldWidget(),
              ),
              Wrap(
                spacing: 12,
                children: [
                  CardOfFilter(
                    label: 'Todos',
                    onPressed: () {},
                    selected: true,
                  ),
                  CardOfFilter(
                    label: 'Histórico',
                    onPressed: () {},
                    selected: false,
                  ),
                  CardOfFilter(
                    label: 'Salvos',
                    onPressed: () {},
                    selected: false,
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
