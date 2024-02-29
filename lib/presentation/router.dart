// Define the application router using GoRouter.
import 'package:clean_architecture_drift_getit_bloc/presentation/screens/home_screen.dart';
import 'package:clean_architecture_drift_getit_bloc/presentation/screens/users_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/', // Set the initial location of the router.
  routes: <RouteBase>[
    // Define a list of routes.
    // Route for the home screen.
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    // Route for the users screen.
    GoRoute(
      name: 'users',
      path: '/users',
      builder: (context, state) =>
          const UsersScreen(), // Build the UsersScreen when this route is matched.
    ),
  ],
);
