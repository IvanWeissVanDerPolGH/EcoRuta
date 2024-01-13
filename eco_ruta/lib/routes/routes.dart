import 'package:eco_ruta/src/login/pages/login_page.dart';
import 'package:eco_ruta/src/splash/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

class Routes {
  final routes = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
  ]);
}
