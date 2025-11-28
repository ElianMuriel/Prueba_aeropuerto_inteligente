import 'package:go_router/go_router.dart';

import 'pages/airport_home_page.dart';
import 'pages/package_calculator_page.dart';

final GoRouter appRouter = GoRouter(
    routes: [
        GoRoute(
            path: '/',
            builder:(_, __) => const AirportHomePage(),
        ),
        GoRoute(
            path: '/package',
            builder:(_, __) => const PackageCalculatorPage(),
        ),
    ],
);