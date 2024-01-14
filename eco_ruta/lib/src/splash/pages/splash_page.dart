import 'package:eco_ruta/src/splash/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => SplashBloc()..add(const SplashEvent.started())),
      child: BlocConsumer<SplashBloc, SplashState>(listener: (context, state) {
        if (state.isLogged == true) {
          context.pushReplacement('/login');
        }
      }, builder: (context, state) {
        return const Scaffold(
          body: Center(
              child: Padding(
            padding: EdgeInsets.all(50.0),
            child: LoadingIndicator(
                indicatorType: Indicator.pacman,
                colors: [
                  Colors.orange,
                  Color.fromARGB(255, 253, 99, 3),
                ],
                strokeWidth: 2,
                backgroundColor: Colors.transparent,
                pathBackgroundColor: Colors.transparent),
          )),
        );
      }),
    );
  }
}
