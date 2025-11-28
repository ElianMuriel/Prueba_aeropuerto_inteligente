import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Passenger {
  final String name;
  final double fee;

  Passenger({required this.name, required this.fee});
}

class BoardingDynamicListPage extends StatefulWidget {
  const BoardingDynamicListPage({super.key});

  @override
  State<BoardingDynamicListPage> createState() =>
      _BoardingDynamicListPageState();
}

class _BoardingDynamicListPageState extends State<BoardingDynamicListPage> {
  final nameController = TextEditingController();
  final feeController = TextEditingController();

  final List<Passenger> passengers = [];

  String resultText = '';

  void _addPassenger() {
    final name = nameController.text.trim();
    final fee = double.tryParse(feeController.text) ?? 0;

    if (name.isEmpty || fee <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Nombre obligatorio y tasa > 0'),
        ),
      );
      return;
    }

    setState(() {
      passengers.add(Passenger(name: name, fee: fee));
      nameController.clear();
      feeController.clear();
    });
  }

  void _removePassenger(int index) {
    setState(() {
      passengers.removeAt(index);
    });
  }

  void _calculateTotals() {
    if (passengers.isEmpty) {
      setState(() {
        resultText = 'No hay pasajeros registrados.';
      });
      return;
    }

    double total = 0;

    // ciclo for-in
    for (final p in passengers) {
      total += p.fee;
    }

    final count = passengers.length;
    final promedio = total / count;

    setState(() {
      resultText =
          'Total recaudado: \$${total.toStringAsFixed(2)}\nPromedio por pasajero: \$${promedio.toStringAsFixed(2)}\nNúmero de pasajeros: $count';
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    feeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasas de embarque'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nombre del pasajero',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: feeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Tasa de embarque',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _addPassenger,
                    child: const Text('Agregar pasajero'),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _calculateTotals,
                  child: const Text('Calcular total de tasas'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: passengers.length,
                itemBuilder: (context, index) {
                  final p = passengers[index];
                  return ListTile(
                    title: Text(p.name),
                    subtitle:
                        Text('Tasa: \$${p.fee.toStringAsFixed(2)}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _removePassenger(index),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
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
