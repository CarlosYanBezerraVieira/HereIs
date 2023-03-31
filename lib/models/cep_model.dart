// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

part 'cep_model.g.dart';

@HiveType(typeId: 0)
class CepModel extends HiveObject {
  @HiveField(0)
  final String cep;
  @HiveField(1)
  final String street;
  @HiveField(2)
  final String city;
  @HiveField(3)
  final String uf;
  @HiveField(4)
  final String neighborhood;
  @HiveField(5)
  final String complement;
  @HiveField(6)
  final String ddd;
  @HiveField(7)
  final bool isSave;
  CepModel({
    required this.cep,
    required this.street,
    required this.city,
    required this.uf,
    required this.neighborhood,
    required this.complement,
    required this.ddd,
    this.isSave = false,
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
      'isSave': isSave
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
    return 'CepModel(cep: $cep, street: $street, city: $city, uf: $uf, neighborhood: $neighborhood, complement: $complement, ddd: $ddd, isSave: $isSave)';
  }

  CepModel copyWith({
    String? cep,
    String? street,
    String? city,
    String? uf,
    String? neighborhood,
    String? complement,
    String? ddd,
    bool? isSave,
  }) {
    return CepModel(
      cep: cep ?? this.cep,
      street: street ?? this.street,
      city: city ?? this.city,
      uf: uf ?? this.uf,
      neighborhood: neighborhood ?? this.neighborhood,
      complement: complement ?? this.complement,
      ddd: ddd ?? this.ddd,
      isSave: isSave ?? this.isSave,
    );
  }
}
