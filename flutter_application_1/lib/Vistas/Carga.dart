import 'package:flutter/material.dart';

class Carga extends StatelessWidget {
  const Carga({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned.fill(
          child: IgnorePointer(
            ignoring: true,
            child: ColoredBox(color: Colors.transparent),
          ),
        ),
        Center(
          child: CircularProgressIndicator(
            color: Color.fromARGB(
              255,
              83,
              241,
              4,
            ),
          ),
        ),
      ],
    );
  }
}
