import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_indicator/loading_indicator.dart';

class OverlayIndicator {
  BuildContext _context;

  OverlayIndicator._create(this._context);

  factory OverlayIndicator.of(BuildContext context) {
    return OverlayIndicator._create(context);
  }

  void hide() {
    _context.pop();
  }

  void show() {
    showDialog(
      context: _context,
      barrierDismissible: false,
      barrierColor: const Color.fromARGB(104, 118, 115, 114),
      builder: (context) => const ScreenLoader(),
    );
  }
}

class ScreenLoader extends StatelessWidget {
  final double size;
  const ScreenLoader({Key? key, this.size = 10}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PopScope(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(150),
          child: LoadingIndicator(
              indicatorType: Indicator.ballPulse,
              colors: [Colors.orange],
              strokeWidth: 2,
              backgroundColor: Colors.transparent,
              pathBackgroundColor: Colors.transparent),
        ),
      ),
    );
  }
}
