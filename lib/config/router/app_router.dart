import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:teslo_app/config/router/app_router_notifier.dart';

import '../../features/auth/presentation/screens/screens.dart';
import '../../features/products/presentation/screens/screens.dart';


final goRouterProvider = Provider((ref) {

  final goRouterNotifier = ref.read(goRouterNotifierProvider);
  return  GoRouter(
  initialLocation: '/login',
  refreshListenable: goRouterNotifier,
  routes: [

    //*Primera Pantalla
    GoRoute(path: '/splash',
    builder: (context, state) => const CheckAuthStatusScreen(),
    ),

    ///* Auth Routes
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),

    ///* Product Routes
    GoRoute(
      path: '/',
      builder: (context, state) => const ProductsScreen(),
    ),
  ],

  redirect: (context, state) {
    print(state.matchedLocation);

    return null;
  },
);
});

