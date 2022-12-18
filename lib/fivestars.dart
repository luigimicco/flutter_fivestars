import 'package:flutter/material.dart';

class FiveStars extends StatefulWidget {
  final int stars;
  final Function(int value) onPressed;
  const FiveStars({required this.onPressed, this.stars = 0, super.key});

  @override
  State<FiveStars> createState() => _FiveStarsState();
}

class _FiveStarsState extends State<FiveStars> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return InkWell(
          child: getStar(index),
          onTap: () => widget.onPressed(index),
        );
      }),
    );
  }

  Icon getStar(int pos) {
    if (pos <= widget.stars) {
      return const Icon(
        Icons.star,
        color: Colors.orange,
      );
    } else {
      return const Icon(
        Icons.star_border,
        color: Colors.grey,
      );
    }
  }
}
