import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../core/gifs/gifs.dart';
import 'home/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _controller;
  bool loading = false;
  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff38c172),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            repeat: true,
            Gifs.search,
            controller: _controller,
            onLoaded: (compos) {
              _controller
                ..duration = compos.duration
                ..forward().then((value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                });
            },
          )
        ],
      ),
    );
  }
}
