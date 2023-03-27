import 'package:flutter/material.dart';
import 'package:hereis/core/routes/enums/filter_of_ceps_enum.dart';
import 'package:hereis/pages/home/sections/section_top/widget/text_field_widget.dart';

import 'widget/card_of_filter.dart';

class SectionTop extends StatelessWidget {
  final Function({required TypesOfCepsEnum value}) changeFilter;
  final TypesOfCepsEnum selectedFilter;
  const SectionTop(
      {Key? key, required this.changeFilter, required this.selectedFilter})
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
              const Padding(
                padding: EdgeInsets.only(top: 64, bottom: 32),
                child: TextFieldWidget(),
              ),
              Wrap(
                spacing: 12,
                children: [
                  ...TypesOfCepsEnum.values.map(
                    (filter) => CardOfFilter(
                      label: filter.label,
                      selected: filter == selectedFilter,
                      onPressed: () => changeFilter(
                        value: filter,
                      ),
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
