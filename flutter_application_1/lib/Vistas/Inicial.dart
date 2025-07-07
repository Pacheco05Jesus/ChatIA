import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'Succes1.dart';
import '../Bloc/home_bloc.dart';  // Ajusta según tu estructura

class Inicial extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Inicial> {
  @override
  void initState() {
    super.initState();

    // Ocultar barra de estado y navegación para splash
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    Timer(Duration(seconds: 2), () {
      // Mostrar barra de estado y navegación cuando navegas
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: BlocProvider.of<ChatBloc>(context),
            child: Succes1(response: 'Hola soy ChatIA'),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          width: 200,  // Tamaño razonable para el logo
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
