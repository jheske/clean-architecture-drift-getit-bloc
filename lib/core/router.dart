// Define the application router using GoRouter.
import 'package:clean_architecture_drift_getit_bloc/presentation/screens/home_screen.dart';
import 'package:clean_architecture_drift_getit_bloc/presentation/screens/users_screen.dart';
import 'package:go_router/go_router.dart';

import '../presentation/screens/artist_screen.dart';
import '../presentation/screens/artists_screen.dart';
import '../presentation/screens/database_viewer_screen.dart';
import '../presentation/screens/user_screen.dart';

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
    GoRoute(
      name: 'user',
      path: '/user',
      builder: (context, state) {
        return const UserScreen();
      },
    ),
    // Route for the users screen.
    GoRoute(
      name: 'artists',
      path: '/artists',
      builder: (context, state) =>
          const ArtistsScreen(), // Build the UsersScreen when this route is matched.
    ),
    GoRoute(
      name: 'artist',
      path: '/artist',
      builder: (context, state) {
        return const ArtistScreen();
      },
    ),
    // Route for the database view screen.
    GoRoute(
      name: 'database-view',
      path: '/database-view',
      builder: (context, state) {
        // Implement the screen for viewing the database here.
        // You can use the DatabaseViewer widget or any custom implementation.
        return DatabaseViewsScreen(); // Build the DatabaseViewsScreen when this route is matched.
      },
    ),
  ],
);
