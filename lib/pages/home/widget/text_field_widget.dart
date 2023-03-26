import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key});

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
          suffixIcon: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Icon(
                Icons.search_outlined,
                color: Colors.black,
              )),
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
