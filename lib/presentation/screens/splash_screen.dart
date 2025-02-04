import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Контроллер для анимации
    _controller = AnimationController(
      duration: Duration(seconds: 2), // Длительность анимации
      vsync: this,
    );

    // Анимация прозрачности (fade-in)
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn, // Тип кривой для плавного перехода
      ),
    );

    // Запуск анимации
    _controller.forward();

    // Переход на главный экран через 2 секунды
    Future.delayed(Duration(seconds: 2), () {
      context.go('/main');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
        255,
        59,
        33,
        33,
      ), // Цвет фона для SplashScreen
      body: Center(
        child: FadeTransition(
          // Применение анимации fade-in
          opacity: _animation,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("assets/images/logo.png", width: 70),
              ),
              SizedBox(height: 20),
              Text(
                'ISAP VPN',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: CircularProgressIndicator(
                  color: Colors.white, // Цвет кружка
                  strokeWidth: 4.0, // Толщина круга
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
