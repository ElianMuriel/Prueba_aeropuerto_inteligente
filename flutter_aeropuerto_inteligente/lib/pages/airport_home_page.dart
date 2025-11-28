import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AirportHomePage extends StatelessWidget {
  const AirportHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aeropuerto Inteligente'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Bienvenido al Aeropuerto Inteligente. '
              'Seleccione una opción para gestionar su vuelo.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go('/package-calculator'),
              child: const Text('Calculadora de equipaje'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => context.go('/schedule'),
              child: const Text('Plan de vuelos'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => context.go('/boarding-priority'),
              child: const Text('Prioridad de embarque'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => context.go('/boarding-dynamic-list'),
              child: const Text('Lista dinámica de tasas de embarque'),
            ),
          ],
        ),
      ),
    );
  }
}
