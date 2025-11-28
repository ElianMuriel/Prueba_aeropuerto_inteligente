import 'package:go_router/go_router.dart';

import 'pages/airport_home_page.dart';
import 'pages/package_calculator_page.dart';
import 'pages/boarding_dinamicList_page.dart';
import 'pages/boarding_priority_page.dart';
import 'pages/shedule_page.dart';

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
        GoRoute(
            path: '/boarding-dinamiclist',
            builder:(_, __) => const BoardingDinamicListPage(),
        ),
        GoRoute(
            path: '/boarding-priority',
            builder:(_, __) => const BoardingPriorityPage(),
        ),
        GoRoute(
            path: '/shedule',
            builder:(_, __) => const ShedulePage(),
        ),
    ],
);