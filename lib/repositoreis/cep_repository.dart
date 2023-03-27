import 'dart:collection';

import 'package:flutter/material.dart';

import '../models/cep_model.dart';

class CepRepository extends ChangeNotifier {
  final List<CepModel> _ceps = [];
  UnmodifiableListView<CepModel> get ceps => UnmodifiableListView(_ceps);

  void addCEP({required CepModel cep}) {
    _ceps.add(cep);
    notifyListeners();
  }

  CepRepository() {
    _ceps.addAll([
      CepModel(
          cep: 'a',
          street: 'b',
          city: 'c',
          state: 'd',
          neighborhood: 'f',
          complemento: 'g',
          ddd: 'i'),
    ]);
  }
}
