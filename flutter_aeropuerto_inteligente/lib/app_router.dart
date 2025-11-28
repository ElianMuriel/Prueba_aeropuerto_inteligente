import 'package:go_router/go_router.dart';

import 'pages/airport_home_page.dart';
import 'pages/package_calculator_page.dart';
import 'pages/shedule_page.dart';
import 'pages/boarding_priority_page.dart';
import 'pages/boarding_dinamicList_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AirportHomePage(),
    ),
    GoRoute(
      path: '/package-calculator',
      builder: (context, state) => const PackageCalculatorPage(),
    ),
    GoRoute(
      path: '/schedule',
      builder: (context, state) => const ShedulePage(),
    ),
    GoRoute(
      path: '/boarding-priority',
      builder: (context, state) => const BoardingPriorityPage(),
    ),
    GoRoute(
      path: '/boarding-dynamic-list',
      builder: (context, state) => const BoardingDynamicListPage(),
    ),
  ],
);
