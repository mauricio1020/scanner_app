

import 'package:go_router/go_router.dart';
import 'package:scanner_app/presentations/screens/movies/home_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',


  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
  ]
  
);