import 'package:flutter/material.dart';
import 'package:hereis/core/enums/box_name_enum.dart';
import 'package:hereis/database/db.dart';
import '../models/cep_model.dart';
import '../pages/home/sections/section_list_of_items/widget/item_card.dart';
import '../services/via_cep_service.dart';

class CepRepository extends ChangeNotifier {
  final List<CepModel> _cepsIsFavorite = [];
  final List<CepModel> _ceps = [];
  final List<CepModel> _historyOfCEPs = [];

  final _loadingSearch = ValueNotifier(false);
  final _loading = ValueNotifier(true);
  final _showCEPIsFavorites = ValueNotifier(false);

  bool _hasPopulate = false;

  List<CepModel> get cepsIsFavorite => _cepsIsFavorite;
  List<CepModel> get historyOfCEPs => _historyOfCEPs;

  bool get showCEPIsFavorites => _showCEPIsFavorites.value;
  bool get loadingSearch => _loadingSearch.value;
  bool get loading => _loading.value;

  final GlobalKey<AnimatedListState> keyIsFavorite = GlobalKey();
  final GlobalKey<AnimatedListState> keyHistoryOfCEPs = GlobalKey();

  showLoadingSearch({required bool value}) {
    _loadingSearch.value = value;
    notifyListeners();
  }

  showLoading({required bool value}) {
    _loading.value = value;
    notifyListeners();
  }

  setShowCEPIsFavorites({required bool value}) {
    _showCEPIsFavorites.value = value;
    notifyListeners();
  }

  Future<void> initRepository() async {
    final ceps = await DB.intance.getAll(
      boxName: BoxNameEnum.ceps,
    );
    if (ceps != null) {
      _ceps.addAll(List.from(ceps));
    }
  }

  Future<void> saveCEP({required CepModel cep}) async {
    await DB.intance.put(
      boxName: BoxNameEnum.ceps,
      key: cep.cep,
      content: cep,
    );
  }

  Future<void> deleteCEP({required CepModel cep}) async {
    DB.intance.delete(
      boxName: BoxNameEnum.ceps,
      key: cep.cep,
    );
    removeItemAnimated(isFavorite: showCEPIsFavorites, cep: cep);
  }

  void changeIsSaveOfCEP({required bool isFavorite, required CepModel cep}) {
    removeItemAnimated(isFavorite: isFavorite, cep: cep);
    insertItem(isFavorite: isFavorite, cep: cep);
    notifyListeners();
  }

  removeItemAnimated({required bool isFavorite, required CepModel cep}) {
    if (!isFavorite) {
      keyHistoryOfCEPs.currentState!.removeItem(
        _historyOfCEPs.indexOf(cep),
        (_, animation) => SizeTransition(
          sizeFactor: animation,
          child: ItemCard(
            deleteItem: (value) {},
            model: cep,
            onChanged: (value) {},
          ),
        ),
        duration: const Duration(milliseconds: 500),
      );
      _historyOfCEPs.remove(cep);
    }
    if (isFavorite) {
      keyIsFavorite.currentState!.removeItem(
        _cepsIsFavorite.indexOf(cep),
        (_, animation) => SizeTransition(
          sizeFactor: animation,
          child: ItemCard(
            deleteItem: (value) {},
            model: cep,
            onChanged: (value) {},
          ),
        ),
        duration: const Duration(seconds: 1),
      );
      _cepsIsFavorite.remove(cep);
    }
  }

  insertItem({required bool isFavorite, required CepModel cep}) {
    final cepIn = cep.copyWith(isFavorite: !isFavorite);
    if (!isFavorite) {
      _cepsIsFavorite.insert(0, cepIn);
    } else {
      _historyOfCEPs.insert(0, cepIn);
    }

    saveCEP(cep: cepIn);
  }

  populate() async {
    showLoading(value: true);
    if (!_hasPopulate) {
      await initRepository();

      final List<CepModel> cepsIsFavoriteIn = [];
      final List<CepModel> historyOfCEPsIn = [];
      for (var cep in _ceps) {
        if (cep.isFavorite) {
          cepsIsFavoriteIn.insert(0, cep);
        } else {
          historyOfCEPsIn.insert(0, cep);
          keyHistoryOfCEPs.currentState!
              .insertItem(0, duration: const Duration(milliseconds: 500));
        }
      }

      _cepsIsFavorite.addAll(cepsIsFavoriteIn);
      _historyOfCEPs.addAll(historyOfCEPsIn);
      _hasPopulate = true;
    }
    showLoading(value: false);
  }

  bool hasCEP({required CepModel cep}) =>
      (_historyOfCEPs.any((element) => element.cep == cep.cep) ||
          _cepsIsFavorite.any((element) => element.cep == cep.cep));

  searchCEP({required String search, required BuildContext context}) async {
    try {
      showLoadingSearch(value: true);

      final result = await ViaCepService.searchCEP(cep: search);

      if (!hasCEP(cep: result)) {
        _historyOfCEPs.insert(0, result);
        keyHistoryOfCEPs.currentState!
            .insertItem(0, duration: const Duration(milliseconds: 500));
        notifyListeners();
        saveCEP(cep: result);

        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'CEP encontrado com sucesso!',
          ),
          backgroundColor: Colors.green,
        ));
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'CEP já existe.',
          ),
          backgroundColor: Colors.orange,
        ));
      }
    } on Exception catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Requisição inválida, revise os dados ou verifique sua internet.',
        ),
        backgroundColor: Colors.red,
      ));
    } finally {
      showLoadingSearch(value: false);
    }
  }
}
