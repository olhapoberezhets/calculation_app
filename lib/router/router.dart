import 'package:calculation_app/presentation/pages/grid_page.dart';
import 'package:calculation_app/presentation/pages/home_page.dart';
import 'package:calculation_app/presentation/pages/process_page.dart';
import 'package:calculation_app/presentation/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter buildRouter = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: "/",
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: "/process",
        builder: (context, state) => const ProcessPage(),
      ),
      GoRoute(
        path: "/result",
        builder: (context, state) => const ResultPage(),
      ),
      GoRoute(
          path: '/grid',
          builder: (BuildContext context, GoRouterState state) {
            final data = state.extra! as Map<String, dynamic>;
            return GridPage(
              crossAxisCount: data["crossAxisCount"],
              itemCount: data["itemCount"],
              task: data["task"],
              result: data["result"],
            );
          }),
    ],
  );
}
