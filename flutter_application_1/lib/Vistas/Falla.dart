import 'package:flutter/material.dart';

class Falla extends StatelessWidget {
  final String mensaje;
  final VoidCallback onReintentar;

  const Falla({
    super.key,
    this.mensaje = 'Ha ocurrido un error inesperado.',
    required this.onReintentar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline,
                size: 80,
                color: Color.fromARGB(255, 28, 255, 3),
              ),
              const SizedBox(height: 20),
              Text(
                mensaje,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, color: Colors.black87),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: onReintentar,
                child: const Text('Reintentar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
