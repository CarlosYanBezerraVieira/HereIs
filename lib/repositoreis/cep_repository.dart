import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:hereis/core/routes/enums/box_name_enum.dart';
import 'package:hereis/database/db.dart';
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
    initRepository();
  }

  Future<void> initRepository() async {
    final ceps = await DB.intance.getAll(
      boxName: BoxNameEnum.ceps,
    );
    if (ceps != null) {
      for (var element in List.castFrom(ceps)) {
        _ceps.add(element);
      }
      notifyListeners();
    }
  }

  Future<void> saveCEP({required CepModel cep}) async {
    addCEP(cep: cep);
    await DB.intance.put(
      boxName: BoxNameEnum.ceps,
      key: cep.cep,
      content: cep,
    );
  }

  Future<void> deleteCEP({required String cep}) async {
    DB.intance.delete(
      boxName: BoxNameEnum.ceps,
      key: cep,
    );
  }
}
