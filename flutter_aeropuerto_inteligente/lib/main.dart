import 'package:flutter/material.dart';
import 'app_router.dart';

void main() {
  runApp(const AirportMenuApp());
}

class AirportMenuApp extends StatelessWidget {
  const AirportMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Aeropuerto Inteligente - GoRouter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}
