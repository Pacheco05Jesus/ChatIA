import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'Succes1.dart';

class Inicial extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Inicial> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    Timer(Duration(seconds: 2), () {
      
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
      body: SizedBox.expand(
        child: Center(
          child: Image.asset(
            'assets/logo.png',
            width: 5700,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
