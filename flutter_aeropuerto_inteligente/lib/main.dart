import 'package:flutter/material.dart';
import 'app_router.dart';

void main() {
  runApp(const AirportApp());
}

class AirportApp extends StatelessWidget {
  const AirportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Aeropuerto Inteligente',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      routerConfig: appRouter,
    );
  }
}
