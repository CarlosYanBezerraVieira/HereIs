import 'package:flutter/material.dart';

class CardOfFilter extends StatelessWidget {
  final String label;
  final bool selected;
  final void Function()? onPressed;
  const CardOfFilter(
      {Key? key,
      required this.label,
      required this.selected,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              selected ? Colors.yellow[800] : const Color(0xff2c313a),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ))),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.black : Colors.white,
          ),
        ));
  }
}
