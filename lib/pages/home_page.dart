import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            child: LottieBuilder.network(
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
                "https://assets2.lottiefiles.com/packages/lf20_mksle47o.json"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hoverColor: Colors.white,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                    )),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                    )),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                    )),
                    errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                    )),
                    hintText: "Pesquisar",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
