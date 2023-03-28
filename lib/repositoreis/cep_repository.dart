import 'dart:collection';

import 'package:flutter/material.dart';

import '../models/cep_model.dart';

class CepRepository extends ChangeNotifier {
  final List<CepModel> _ceps = [];
  UnmodifiableListView<CepModel> get ceps => UnmodifiableListView(_ceps);

  final loading = ValueNotifier(false);

  void addCEP({required CepModel cep}) {
    _ceps.add(cep);
    notifyListeners();
  }

  showLoading({required bool value}) {
    loading.value = value;
    notifyListeners();
  }

  CepRepository() {
    _ceps.addAll([
      CepModel(
          cep: 'a',
          street: 'b',
          city: 'c',
          uf: 'd',
          neighborhood: 'f',
          complement: 'g',
          ddd: 'i'),
    ]);
  }
}
