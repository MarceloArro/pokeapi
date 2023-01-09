import 'package:flutter/material.dart';

class CategoryCardCircle extends StatelessWidget {
  const CategoryCardCircle({
    super.key,
    required this.cardHeight,
  });

  final double cardHeight;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -cardHeight * 0.68,
      left: -cardHeight * 0.6,
      child: CircleAvatar(
        radius: (cardHeight * 1.06) / 2,
        backgroundColor: Colors.white.withOpacity(0.14),
      ),
    );
  }
}
