import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
    return FutureBuilder(
        future: isOnline(),
        builder: (context, online) {
          if (online.data ?? true) {
            return Container(
              color: const Color(0xff38c172),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LottieBuilder.network(
                    "https://assets3.lottiefiles.com/packages/lf20_hr4apm5d.json",
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
          return Container(
            color: const Color(0xff38c172),
            child: Material(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_rounded,
                    color: Colors.white,
                    size: 100,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Erro na conexão.',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      setState(() {
                        loading = true;
                      });
                      Future.delayed(const Duration(seconds: 1), () {
                        setState(() {
                          loading = false;
                        });
                      });
                      await isOnline();
                    },
                    icon: loading
                        ? const SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(
                              color: Colors.yellow,
                            ),
                          )
                        : const Icon(
                            Icons.refresh,
                            color: Colors.yellow,
                          ),
                  )
                ],
              ),
            ),
          );
        });
  }

  static Future<bool> isOnline() async {
    try {
      final url = Uri.parse('https://www.google.com.br/');
      await http.get(url);

      return true;
    } catch (e) {
      throw false;
    }
  }
}
