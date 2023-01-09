import 'package:flutter/material.dart';

class BackgroundBoxDecoration extends StatelessWidget {
  const BackgroundBoxDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 3.1416 * 5 / 12,
      child: Container(
        width: 144,
        height: 144,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: const Alignment(-0.2, -0.2),
            end: const Alignment(1.5, -0.3),
            colors: [
              Colors.white.withOpacity(0.3),
              Colors.white.withOpacity(0),
            ],
          ),
        ),
      ),
    );
  }
}
