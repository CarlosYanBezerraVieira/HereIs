// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hereis/core/routes/enums/type_of_ceps_enum.dart';

class CepModel {
  final String cep;
  final String street;
  final String city;
  final String uf;
  final String neighborhood;
  final String complement;
  final String ddd;
  final TypesOfCepsEnum type;
  CepModel({
    required this.cep,
    required this.street,
    required this.city,
    required this.uf,
    required this.neighborhood,
    required this.complement,
    required this.ddd,
    this.type = TypesOfCepsEnum.all,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cep': cep,
      'street': street,
      'city': city,
      'uf': uf,
      'neighborhood': neighborhood,
      'complemento': complement,
      'ddd': ddd,
      'type': type.name,
    };
  }

  factory CepModel.fromMap(Map<String, dynamic> map) {
    return CepModel(
      cep: map['cep'] ?? "",
      street: map['logradouro'] ?? "",
      city: map['localidade'] ?? "",
      uf: map['uf'] ?? "",
      neighborhood: map['bairro'] ?? "",
      complement: map['complemento'] ?? "",
      ddd: map['ddd'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory CepModel.fromJson(String source) =>
      CepModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CepModel(cep: $cep, street: $street, city: $city, state: $uf, neighborhood: $neighborhood, complemento: $complement, ddd: $ddd, type: $type)';
  }
}
