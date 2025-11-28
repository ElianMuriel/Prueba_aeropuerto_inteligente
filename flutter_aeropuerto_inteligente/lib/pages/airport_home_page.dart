import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AirportHomePage extends StatelessWidget {
  const AirportHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menú Aeropuerto')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Seleccione una opción:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () => context.go('/package'),
              child: const Text('Calculador de Peso Equipage'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/boarding-dinamiclist'),
              child: const Text('Lista dinámica de embarque'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/boarding-priority'),
              child: const Text('Prioridad de embarque'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/shedule'),
              child: const Text('Plan de vuelos'),
            ),
          ],
        ),
      ),
    );
  }
}
