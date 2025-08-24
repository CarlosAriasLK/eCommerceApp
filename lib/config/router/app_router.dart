
import 'package:go_router/go_router.dart';

import 'package:e_commerce_app/presentation/screens/checkout_screen.dart';
import 'package:e_commerce_app/presentation/screens/successfull_screen.dart';
import 'package:e_commerce_app/presentation/screens/home_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',

  routes: [
    GoRoute(
      path: '/home/:page',
      builder: (context, state) {
        final indexPage = int.parse( state.pathParameters["page"] ?? 'no-indexpage' );
        return HomeScreen( index: indexPage );
      },
    ),

    GoRoute(
      path: '/checkout',
      builder: (context, state) => CheckoutScreen(),
    ),

    GoRoute(
      path: '/successful',
      builder: (context, state) => SuccessfullScreen(),
    )
  ]
);