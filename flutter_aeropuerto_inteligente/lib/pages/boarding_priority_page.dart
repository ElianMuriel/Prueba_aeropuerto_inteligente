import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BoardingPriorityPage extends StatefulWidget {
  const BoardingPriorityPage({super.key});

  @override
  State<BoardingPriorityPage> createState() => _BoardingPriorityPageState();
}

class _BoardingPriorityPageState extends State<BoardingPriorityPage> {
  final List<String> tiposPasajero = [
    'Adulto mayor',
    'Familia con niños',
    'Pasajero regular',
  ];

  final List<String> clasesBoleto = [
    'Económica',
    'Ejecutiva',
  ];

  String? tipoSeleccionado;
  String? claseSeleccionada;
  String resultado = '';

  void _calcularPrioridad() {
    if (tipoSeleccionado == null || claseSeleccionada == null) {
      setState(() {
        resultado = 'Seleccione tipo de pasajero y clase de boleto.';
      });
      return;
    }

    String prioridad;

    // CONDICIONALES según enunciado
    if (tipoSeleccionado == 'Adulto mayor' ||
        claseSeleccionada == 'Ejecutiva') {
      prioridad = 'Alta';
    } else if (tipoSeleccionado == 'Familia con niños') {
      prioridad = 'Media';
    } else {
      prioridad = 'Baja';
    }

    setState(() {
      resultado =
          'Tipo: $tipoSeleccionado\nClase: $claseSeleccionada\nPrioridad de embarque: $prioridad';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prioridad de embarque'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: tipoSeleccionado,
              decoration: const InputDecoration(
                labelText: 'Tipo de pasajero',
                border: OutlineInputBorder(),
              ),
              items: tiposPasajero
                  .map((t) => DropdownMenuItem(
                        value: t,
                        child: Text(t),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  tipoSeleccionado = value;
                });
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: claseSeleccionada,
              decoration: const InputDecoration(
                labelText: 'Clase de boleto',
                border: OutlineInputBorder(),
              ),
              items: clasesBoleto
                  .map((c) => DropdownMenuItem(
                        value: c,
                        child: Text(c),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  claseSeleccionada = value;
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calcularPrioridad,
              child: const Text('Calcular prioridad'),
            ),
            const SizedBox(height: 16),
            Text(
              resultado,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
