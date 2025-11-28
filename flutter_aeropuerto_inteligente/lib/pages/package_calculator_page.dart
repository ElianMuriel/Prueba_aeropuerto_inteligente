import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PackageCalculatorPage extends StatefulWidget {
  const PackageCalculatorPage({super.key});

  @override
  State<PackageCalculatorPage> createState() => _PackageCalculatorPageState();
}

class _PackageCalculatorPageState extends State<PackageCalculatorPage> {
  final weightController = TextEditingController();
  final limitController = TextEditingController();

  String resultText = '';

  void _verifyLuggage() {
    final weight = double.tryParse(weightController.text) ?? 0;
    final limit = double.tryParse(limitController.text) ?? 0;

    if (limit <= 0) {
      setState(() {
        resultText = 'Ingrese un límite válido mayor a 0.';
      });
      return;
    }

    final difference = weight - limit;

    if (weight > limit) {
      setState(() {
        resultText =
            'Equipaje con SOBREpeso.\nExceso: ${difference.toStringAsFixed(2)} kg.';
      });
    } else {
      final remaining = limit - weight;
      setState(() {
        resultText =
            'Equipaje dentro del límite.\nLe sobran ${remaining.toStringAsFixed(2)} kg.';
      });
    }
  }

  @override
  void dispose() {
    weightController.dispose();
    limitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de equipaje'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(
              'assets/images/destino_destacado.jpg',
              height: 180,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Peso del equipaje (kg)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: limitController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Límite permitido (kg)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _verifyLuggage,
              child: const Text('Verificar equipaje'),
            ),
            const SizedBox(height: 16),
            Text(
              resultText,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
