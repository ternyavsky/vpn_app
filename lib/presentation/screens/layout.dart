import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final Widget child;
  const Layout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                const Color.fromARGB(
                  255,
                  10,
                  10,
                  10,
                ).withOpacity(0.7), // Темный цвет с прозрачностью
                BlendMode
                    .colorBurn, // Режим наложения (делает изображение темнее)
              ),
              child: Image.asset('assets/images/bg.jpg', fit: BoxFit.cover),
            ),
          ),
          SafeArea(child: child),
        ],
      ),
    );
  }
}
