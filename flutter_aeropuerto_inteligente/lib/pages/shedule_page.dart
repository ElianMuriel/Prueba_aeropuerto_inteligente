import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShedulePage extends StatefulWidget {
  const ShedulePage({super.key});

  @override
  State<ShedulePage> createState() => _ShedulePageState();
}

class _ShedulePageState extends State<ShedulePage> {
  final List<TextEditingController> _controllers =
      List.generate(5, (_) => TextEditingController());

  String resultText = '';

  void _calculateTimes() {
    int total = 0;

    // CICLO for requerido
    for (int i = 0; i < _controllers.length; i++) {
      final value = int.tryParse(_controllers[i].text) ?? 0;
      total += value;
    }

    final count = _controllers.length;
    final double promedio = count > 0 ? total / count : 0;

    setState(() {
      resultText =
          'Tiempo total: $total minutos\nPromedio de duración: ${promedio.toStringAsFixed(2)} minutos';
    });
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plan de vuelos'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _controllers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: TextField(
                      controller: _controllers[index],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Duración vuelo ${index + 1} (min)',
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _calculateTimes,
              child: const Text('Calcular tiempo total'),
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
