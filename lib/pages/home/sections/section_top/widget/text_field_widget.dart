import 'package:flutter/material.dart';
import 'package:hereis/models/cep_model.dart';
import 'package:hereis/services/via_cep_service.dart';

class TextFieldWidget extends StatefulWidget {
  final Function(CepModel value) callback;
  const TextFieldWidget({super.key, required this.callback});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool loading = false;
  late TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

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
        style: const TextStyle(color: Colors.white),
        controller: searchController,
        cursorColor: Colors.white,
        keyboardType: TextInputType.number,
        maxLines: 1,
        decoration: InputDecoration(
          suffixIconConstraints: const BoxConstraints(
            maxHeight: 50,
            maxWidth: 50,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Visibility(
              visible: !loading,
              replacement: const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )),
              child: GestureDetector(
                onTap: () async {
                  try {
                    setState(() {
                      loading = true;
                    });
                    final result = await ViaCepService.searchCEP(
                        cep: searchController.text);
                    widget.callback(result);
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
                  } finally {
                    setState(() {
                      loading = false;
                    });
                  }
                },
                child: Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.search_outlined,
                      color: Colors.black,
                    )),
              ),
            ),
          ),
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
