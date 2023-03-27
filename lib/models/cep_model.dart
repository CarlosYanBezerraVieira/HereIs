// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hereis/core/routes/enums/type_of_ceps_enum.dart';

class CepModel {
  final String cep;
  final String street;
  final String city;
  final String state;
  final String neighborhood;
  final String complemento;
  final String ddd;
  final TypesOfCepsEnum type;
  CepModel({
    required this.cep,
    required this.street,
    required this.city,
    required this.state,
    required this.neighborhood,
    required this.complemento,
    required this.ddd,
    this.type = TypesOfCepsEnum.all,
  });
}
