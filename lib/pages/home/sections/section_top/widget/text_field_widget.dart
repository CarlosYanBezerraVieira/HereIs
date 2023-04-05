import 'package:flutter/material.dart';
import 'package:hereis/repositoreis/cep_repository.dart';
import 'package:provider/provider.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
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
              visible: !Provider.of<CepRepository>(context).loadingSearch,
              replacement: const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )),
              child: GestureDetector(
                onTap: () async {
                  if (searchController.text.isNotEmpty) {
                    Provider.of<CepRepository>(context, listen: false)
                        .searchCEP(
                            context: context, search: searchController.text);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        'Por favor preencha os dados.',
                      ),
                      backgroundColor: Colors.red,
                    ));
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
