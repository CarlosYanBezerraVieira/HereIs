import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hereis/models/cep_model.dart';
import 'package:hereis/services/via_cep_service.dart';

class TextFieldWidget extends StatelessWidget {
  final Function(CepModel value) callback;
  const TextFieldWidget({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ).copyWith(left: 16),
      decoration: BoxDecoration(
          color: const Color(0xff2c313a),
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () async {
              try {
                final result = await ViaCepService.searchCEP(cep: '63031000');
                callback(result);
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                    'CEP encontrado com sucesso!',
                  ),
                  backgroundColor: Colors.green,
                ));
              } on Exception catch (_) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                    'Requisição inválida, revise os dados!',
                  ),
                  backgroundColor: Colors.red,
                ));
              }
            },
            child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Icon(
                  Icons.search_outlined,
                  color: Colors.black,
                )),
          ),
          fillColor: Colors.white,
          hoverColor: Colors.white,
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
          enabledBorder:
              const UnderlineInputBorder(borderSide: BorderSide.none),
          focusedBorder:
              const UnderlineInputBorder(borderSide: BorderSide.none),
          errorBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
          hintText: "Pesquisar",
        ),
      ),
    );
  }
}
